import boto3
import time
import os


client = boto3.client('rds')

try:
    tag_key = os.environ['TAG_KEY']
    tag_values = os.environ['TAG_VALUES'].split(',')
except KeyError:
    print('Environment variable TAG_KEY or TAG_VALUE not set')
else:
    for instance in client.describe_db_instances()['DBInstances']:
        instance_tags = client.list_tags_for_resource(ResourceName=instance['DBInstanceArn'])['TagList']

        if instance['DBInstanceStatus'] != 'available':
            print('Skipping instance, not available: {0}'.format(instance['DBInstanceIdentifier']))
            continue

        if not [tag for tag in instance_tags if tag['Key'] == tag_key and tag['Value'] in tag_values]:
            print('Skipping instance, tags do not match: {0}'.format(instance['DBInstanceIdentifier']))
            continue

        print('Stopping instance {0}'.format(instance['DBInstanceIdentifier']))

        try:
            if instance['StorageType'] == 'aurora':
                client.stop_db_cluster(DBClusterIdentifier=instance['DBClusterIdentifier'])
            else:
                client.stop_db_instance(DBInstanceIdentifier=instance['DBInstanceIdentifier'])
        except Exception as e:
            print('Failed to stop instance {0}: {1}'.format(instance['DBInstanceIdentifier'], e))

try:
    instance_identifier = os.environ['INSTANCE_IDENTIFIER']
except KeyError:
    print('Environment variable INSTANCE_NAME not set')
else:
    not_found = True
    for instance in client.describe_db_instances()['DBInstances']:
        if instance['DBInstanceIdentifier'] == instance_identifier:
            not_found = False
            if instance['DBInstanceStatus'] != 'available':
                print('Skipping instance, not available: {0}'.format(instance['DBInstanceIdentifier']))
                continue

            print('Stopping instance {0}'.format(instance['DBInstanceIdentifier']))
            try:
                if instance['StorageType'] == 'aurora':
                    client.stop_db_cluster(DBClusterIdentifier=instance['DBClusterIdentifier'])
                else:
                    client.stop_db_instance(DBInstanceIdentifier=instance['DBInstanceIdentifier'])
            except Exception as e:
                print('Failed to stop instance {0}: {1}'.format(instance['DBInstanceIdentifier'], e))

    if not_found:
        print('No DB found with instance identifier: {0}'.format(instance_identifier))
