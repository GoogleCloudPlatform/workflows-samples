from googleapiclient.discovery import build
import json
import sys

from google.oauth2 import service_account
import googleapiclient.discovery

workflow_service = build('workflowexecutions', 'v1')


def trigger_gcs_dlp(event, context):
    # request_json = request.get_json()
    # parent = request_json['parent']
    parent = "projects/uri-test/locations/us-central1/workflows/DlpGcsFile"
    body = {"argument": json.dumps(event)}
    # body = {"argument": '{"project": "uri-test","zone": "us-east1-b"}'}
    workflow = workflow_service.projects().locations().workflows().executions().create(
        parent=parent, body=body).execute()

    return workflow
