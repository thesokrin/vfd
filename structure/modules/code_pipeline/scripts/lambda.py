from __future__ import print_function
import sys
sys.path.append("lib")
sys.path.append("unzip_package")

import sys
import boto3
import botocore
import json
import os
import urllib
import zipfile
import traceback
from boto3.session import Session
from unzip_package import code_pipeline, file_manager

"""
Simple lambda function to take a zip file, unpackage its contents, move them
to a given s3 location, and then return certain files back.

Based on: https://github.com/mehmetboraezer/aws-lambda-unzip
help: http://docs.aws.amazon.com/codepipeline/latest/userguide/actions-invoke-lambda-function.html#actions-invoke-lambda-function-json-event-example
more help on uploading, second comment about kms: https://stackoverflow.com/questions/33238826/how-do-you-use-boto3-download-file-with-aws-kms
"""


boto3_code_pipeline = boto3.client('codepipeline')
def put_job_success(job_id, message):
    """Notify CodePipeline of a successful job

    Args:
        job: The CodePipeline job ID
        message: A message to be logged relating to the job status

    Raises:
        Exception: Any exception thrown by .put_job_success_result()

    Taken from: http://docs.aws.amazon.com/codepipeline/latest/userguide/actions-invoke-lambda-function.html#actions-invoke-lambda-function-json-event-example

    """
    print('Putting job success')
    print(message)
    boto3_code_pipeline.put_job_success_result(jobId=job_id)

def put_job_failure(job_id, message):
    """Notify CodePipeline of a failed job

    Args:
        job: The CodePipeline job ID
        message: A message to be logged relating to the job status

    Raises:
        Exception: Any exception thrown by .put_job_failure_result()

    Taken from: http://docs.aws.amazon.com/codepipeline/latest/userguide/actions-invoke-lambda-function.html#actions-invoke-lambda-function-json-event-example

    """
    print('Putting job failure')
    print(message)
    boto3_code_pipeline.put_job_failure_result(jobId=job_id, failureDetails={'message': message, 'type': 'JobFailed'})

def run(code_pipeline_job):
    if 'target_bucket' not in os.environ:
        raise Exception("Missing environment variable: target_bucket")

    if 'target_root_folder' not in os.environ:
        raise Exception("Missing environment variable: target_root_folder")

    if 'expected_file' not in os.environ:
        raise Exception("Missing environment variable: expected_file")

    target_bucket = os.environ['target_bucket']
    target_root_folder = os.environ['target_root_folder']
    expected_file = os.environ['expected_file']

    print(target_bucket)
    print(target_root_folder)
    print(expected_file)

    input_artifacts = code_pipeline_job.getInputArtifacts()
    input_artifact = code_pipeline_job.getArtifact(input_artifacts, 'SourceZip')

    output_artifacts = code_pipeline_job.getOutputArtifacts()
    output_artifact = code_pipeline_job.getArtifact(output_artifacts, 'DeployWar')

    manager = file_manager.Manager(
        code_pipeline_job.getData(),
        expected_file,
        target_bucket,
        target_root_folder
    )
    source_zip_location = manager.getSourceZipLocation(input_artifact)
    unzipped_resources = manager.unzipSource(source_zip_location['bucket'], source_zip_location['key'])
    manager.createExpectedArtifacts(output_artifact, unzipped_resources)

def handler(event, context):
    """
    Main function called by aws lambda. This takes an event dict and context dict. Refer to the
    'help' link at the top of this file for what that structure may look like.
    """
    print(str(event))

    """
    if either of these fail, we'll have to depend on the code pipeline timeout to kick in
    because we can't push a failure to the job without the job id
    """
    event_obj = code_pipeline.Event(event)
    code_pipeline_job = event_obj.getCodePipeline()

    try:
        run(code_pipeline_job)
    except Exception as error:
        stack_trace = traceback.format_exc()
        put_job_failure(code_pipeline_job.code_pipeline_job['id'], "".join(stack_trace))
        print("".join(stack_trace))
        raise error

    put_job_success(code_pipeline_job.code_pipeline_job['id'], "Completed")

def test_run():

    try:
        code_pipeline_job = code_pipeline.CodePipelineJob({})
        run(code_pipeline_job)
    except Exception as error:
        print("This will not run because we are not AWS code pipeline")
        raise error

if __name__ == '__main__':
    test_run()
