#!/usr/bin/env python3

import boto3
import json
import logging
import os
import sys
import requests
import sentry_sdk

from sentry_sdk.integrations.logging import LoggingIntegration
from botocore.exceptions import ClientError
from datetime import datetime

PREFIX = "allocation_assets"

class KubecostReportsExporter:
    def __init__(self) -> None:

        self.log_level = os.environ.get('LOG_LEVEL', 'debug')
        self.logger = self.set_log_level(self.log_level)
        self.parse_env_vars()
        self.s3 = boto3.client('s3')

        if self.sentry_dsn:
            self.enable_sentry_logging()

    def enable_sentry_logging(self):
      sentry_logging = LoggingIntegration(
          level=logging.INFO,        # Capture info and above as breadcrumbs
          event_level=logging.ERROR  # Send errors as events
      )

      sentry_sdk.init(dsn=self.sentry_dsn, integrations=[sentry_logging])


    def set_log_level(self, log_level):
        levels = {
            'debug': logging.DEBUG,
            'info': logging.INFO,
            'warning': logging.WARNING,
            'error': logging.ERROR,
            'critical': logging.CRITICAL
        }

        logger = logging.getLogger("kubecost-reports-exporter")
        logger.setLevel(levels[log_level])
        return logger

    def parse_env_vars(self):

        self.region = os.environ.get('AWS_REGION', 'eu-west-1')
        self.account_canonical_id = os.environ.get('ACCOUNT_CANONICAL_ID')
        self.tags = os.environ.get('TAGS', '')
        self.sentry_dsn = os.environ.get('SENTRY_DSN')
        self.request_timeout = int(os.environ.get('REQUEST_TIMEOUT', '3000'))

        try:
            self.cluster_name = os.environ['CLUSTER_NAME']
            self.bucket_name = os.environ['BUCKET_NAME']
            self.kubecost_endpoint = os.environ['KUBECOST_ENDPOINT']
            self.kubecost_allocation_url = os.environ['KUBECOST_ALLOCATION_URL']
            self.kubecost_assets_url = os.environ['KUBECOST_ASSETS_URL']
            self.kubecost_diagnostics_url = os.environ['KUBECOST_DIAGNOSTICS_URL']

        except KeyError as ke:
            self.logger.error(f"KeyError: environment variable {str(ke)} is not set ")
            sys.exit(1)

    def build_filename(self):
        day_prefix = datetime.utcnow().strftime("%Y_%m_%d")
        time_prefix = datetime.utcnow().strftime("%Y%m%d_%H_%M_%S")
        return f"{self.cluster_name}/{PREFIX}/{day_prefix}/kubecost_export_{PREFIX}_{time_prefix}.json"

    # function calling the kubecost svc to get JSON response with the cost data

    def get_cost_report(self, url):
        try:
            resp = requests.get(url)
            if resp.status_code != 200:
                self.logger.error(f"Error: Failed to reports from {self.cluster_name}: {resp.reason}")
                sys.exit(1)
            return resp.json()
        except Exception as e:
            self.logger.error(f"Could not get cost report: '{str(e)}'")
    # Uploading the JSON string to S3 bucket

    def upload_report_to_aws(self, bucket, s3_file_name, content, account_id):
        self.logger.info(f'Uploading reports for cluster {self.cluster_name}')
        try:
            # provide object access to bucket owner
            self.s3.put_object(
                Bucket=bucket,
                Body=content,
                Key=s3_file_name,
                ServerSideEncryption='AES256',
                GrantFullControl=f'id="{account_id}"'
            )
            self.logger.info("Reports uploaded Successful")
        except ClientError as e:
            self.logger.error(str(e))
            sys.exit(1)

    def parse_tags_from_env(self, tags):
        parsed_tags = {}
        if not tags:
            return parsed_tags
        tags_array = tags.split(",")
        for tag in tags_array:
            tag = tag.split("=")
            parsed_tags[tag[0]] = tag[1]
        return parsed_tags

    def diagnostics_assets(self):
        prometheus_metrics_diag = self.get_cost_report(
            self.kubecost_endpoint + self.kubecost_diagnostics_url)
        diag_result = prometheus_metrics_diag['data']
        for v in diag_result.get('prometheus'):
            if v['id'] == 'kubecostMetric':
                if not v['passed']:
                    self.logger.info("If you use custom Prometheus(not kubecost bundle version), please confirm the Kube cost scrape job is configured: https://docs.kubecost.com/install-and-configure/install/custom-prom#steps-to-disable-kubecosts-prometheus-deployment-not-recommended ")

    def start(self):

        # check that the json has data
        report = {}
        allocation_report = self.get_cost_report(
            self.kubecost_endpoint + self.kubecost_allocation_url)
        assets_report = self.get_cost_report(
            self.kubecost_endpoint + self.kubecost_assets_url)
        if allocation_report["data"] is None:
            self.logger.info("Error: Skipping upload, allocation has no data")
            return
        report.update({'allocation': allocation_report["data"]})

        if assets_report["data"] is None or assets_report["data"] == [{}]:
            self.logger.info("Error: Skipping upload, assets has no data")
            self.diagnostics_assets()
            return
        # data structure differ from opencost model and analyzer model
        if isinstance(assets_report['data'], list):
            report.update({'assets': assets_report["data"]})
        if isinstance(assets_report['data'], dict):
            assets_report_list = [assets_report["data"]]
            report.update({'assets': assets_report_list})
        self.upload_report_to_aws(
            self.bucket_name,
            self.build_filename(),
            json.dumps(report),
            self.account_canonical_id
        )


if __name__ == "__main__":
    KubecostReportsExporter().start()
