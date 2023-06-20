#!/usr/bin/env python3

import boto3
import json
import logging
import os
import sys
import urllib.request
import sentry_sdk

from sentry_sdk.integrations.logging import LoggingIntegration
from urllib.error import HTTPError, URLError
from botocore.exceptions import ClientError
from datetime import datetime


class KubecostReportsExporter:
    def __init__(self) -> None:
        self.s3 = boto3.client('s3')
        self.log_level = os.environ.get('LOG_LEVEL', 'debug')
        self.logger = self.set_log_level(self.log_level)
        self.parse_env_vars()
        self.enable_sentry_logging()

    def enable_sentry_logging(self):
        sentry_logging = LoggingIntegration(
            level=logging.INFO,        # Capture info and above as breadcrumbs
            event_level=logging.ERROR  # Send errors as events
        )

        if self.sentry_dsn:
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

        self.bucket_acl = os.environ.get('BUCKET_ACL', 'private')
        self.region = os.environ.get('AWS_REGION', 'eu-west-1')
        self.create_bucket = eval(os.environ.get("CREATE_BUCKET", 'False'))
        self.account_id = os.environ.get('ACCOUNT_CANONICAL_ID')
        self.tags = os.environ.get('TAGS', '')
        self.sentry_dsn = os.environ.get('SENTRY_DSN')
        self.request_timeout = int(os.environ.get('REQUEST_TIMEOUT', '3000'))

        try:
            self.cluster_name = os.environ['CLUSTER_NAME']
            self.report_type = os.environ['REPORT_TYPE']
            self.kubecost_endpoint = os.environ['KUBECOST_ENDPOINT']
            self.kubecost_url = os.environ['KUBECOST_URL']
            self.bucket_name = os.environ['BUCKET_NAME']

        except KeyError as ke:
            self.logger.error(
                f"KeyError: environment variable {str(ke)} is not set ")
            sys.exit(1)

    def create_s3_bucket(self):
        self.logger.info(f'Creating bucket {self.bucket_name}')
        try:
            self.s3.create_bucket(
                ACL=self.bucket_acl, Bucket=self.bucket_name,
                CreateBucketConfiguration={'LocationConstraint': self.region}
            )
        except ClientError as e:
            code = e.response['Error']['Code']
            if code == 'BucketAlreadyExists' or code == 'BucketAlreadyOwnedByYou':
                self.logger.warning(
                    f"Bucket {self.bucket_name} already exists"
                )
            else:
                self.logger.error(str(e))
                sys.exit(1)

    def build_filename(self):
        day_prefix = datetime.utcnow().strftime("%Y_%m_%d")
        time_prefix = datetime.utcnow().strftime("%Y%m%d_%H_%M_%S")
        return f"{self.cluster_name}/{self.report_type}/{day_prefix}/aws_kubecost_{self.report_type}_{time_prefix}.json"

    # function calling the kubecost svc to get JSON response with the cost data

    def get_cost_report(self, url):
        try:
            with urllib.request.urlopen(url, timeout=self.request_timeout) as f:
                if f.getcode() != 200:
                    self.logger.error(
                        f"Error: Failed to reports from {self.cluster_name}")
                    sys.exit(1)
                return f.read().decode('utf-8')
        except HTTPError as error:
            self.logger.error(
                'Data not retrieved because %s\nURL: %s', error, url)
            sys.exit(1)
        except URLError as error:
            self.logger.error(
                'Failed to retrive cost reports %s\nURL: %s', error, url)
            sys.exit(1)
    # Uploading the JSON string to S3 bucket

    def upload_report_to_aws(self, bucket, s3_file_name, content, account_id):
        self.logger.info(f'Uploading reports for cluster {self.cluster_name}')
        try:
            # if account id is not provided upload without access grant
            if not account_id:
                self.s3.put_object(
                    Bucket=bucket,
                    Body=content,
                    Key=s3_file_name,
                    ServerSideEncryption='AES256'
                )
            else:
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

    def start(self):

        if self.create_bucket:
            self.create_s3_bucket()

        # check that the json has data
        report = self.get_cost_report(
            self.kubecost_endpoint + self.kubecost_url)

        if not bool(json.loads(report)["data"]):
            self.logger.info("Error: Skipping upload, report has no data")
            return

        self.upload_report_to_aws(
            self.bucket_name, self.build_filename(),
            report,
            self.account_id
        )


if __name__ == "__main__":
    KubecostReportsExporter().start()
