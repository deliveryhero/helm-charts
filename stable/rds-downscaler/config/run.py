import boto3
import time
import os


client = boto3.client('rds')
tag_key = os.environ['TAG_KEY']
tag_values = os.environ['TAG_VALUES'].split(',')


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
