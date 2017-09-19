from __future__ import print_function
import sys
import boto3
import botocore
import os
import time
import urllib
import zipfile
from boto3.session import Session

"""
Simple lambda function to take a zip file, unpackage its contents, move them
to a given s3 location, and then return certain files back.

Based on: https://github.com/mehmetboraezer/aws-lambda-unzip
help: http://docs.aws.amazon.com/codepipeline/latest/userguide/actions-invoke-lambda-function.html#actions-invoke-lambda-function-json-event-example
more help on uploading, second comment about kms: https://stackoverflow.com/questions/33238826/how-do-you-use-boto3-download-file-with-aws-kms
"""


class Artifact():
    S3_TYPE = 'S3'

    def __init__(self, artifact):
        self.initialize(artifact)

    def initialize(self, artifact):
        if not isinstance(artifact, dict):
            raise Exception("Invalid artifact passed in, not a dict")

        self.artifact = artifact

    def getLocation(self):
        artifact = self.artifact
        if "location" not in artifact:
            raise Exception("Invalid artifact passed in, missing location key")

        location = artifact['location']
        if not isinstance(location, dict):
            raise Exception("Invalid location found, not a dict")

        return location

    def getS3Location(self):
        location = self.getLocation()
        if "type" not in location or self.S3_TYPE != location['type']:
            raise Exception("Invalid input artifact found. Not an S3 location")

        if "s3Location" not in location:
            raise Exception("Invalid location found, missing s3Location key")

        s3Location = location['s3Location']
        if 'bucketName' not in s3Location and 'objectKey' not in s3Location:
            raise Exception("Invalid s3Location found, missing keys for bucketName or objectKey")

        return {
            'bucket': s3Location['bucketName'],
            'key': s3Location['objectKey']
        }


class Manager():
    localpath = '/tmp/'

    def __init__(self, job_data, expected_file, target_bucket, target_root_folder):
        self.initialize(job_data)
        self.expected_file = expected_file
        self.target_bucket = target_bucket
        self.target_root_folder = target_root_folder

    def initialize(self, job_data):
        self.lambda_s3 = self.getLambdaS3Resource()

        if job_data:
            self.code_pipeline_s3 = self.getCodePipelineS3Resource(job_data)

    def getS3LocationFromArtifact(self, artifact):
        s3_artifact = Artifact(artifact)

        return s3_artifact.getS3Location()

    def getSourceZipLocation(self, artifact):
        s3Location = self.getS3LocationFromArtifact(artifact)
        bucket = s3Location['bucket']
        source_url = s3Location['key'].encode('utf8')
        key = urllib.unquote_plus(source_url)

        return {
            'bucket': bucket,
            'key': key
        }

    def createLambdaS3Location(self, target_folder, filename):
        return os.path.join(self.target_root_folder, target_folder, filename)

    def getExpectedFile(self):
        return self.expected_file

    def unzipSource(self, bucket, key):
        target_bucket = self.target_bucket
        date_string = time.strftime("%Y_%m_%d_%H_%M_%S")
        target_folder = os.path.join(date_string, os.path.dirname(key))

        try:
            local_filename = '/tmp/target.zip'
            self.code_pipeline_s3.Object(bucket, key).download_file(local_filename)
            zfile = zipfile.ZipFile(local_filename)
            namelist = zfile.namelist()

            for filename in namelist:
                source_file_contents = zfile.read(filename)
                target_file = self.createLambdaS3Location(target_folder, filename)
                self.lambda_s3.Object(target_bucket, target_file).put(Body=source_file_contents)
                # free up memory
                source_file_contents = None

            return {
                'bucket': target_bucket,
                'folder': target_folder,
                'filelist': namelist
            }
        except Exception as error:
            print(str(error))
            raise error

    def createExpectedArtifacts(self, artifact, unzipped_resources):
        war_location = self.getS3LocationFromArtifact(artifact)

        filelist = unzipped_resources['filelist']
        source_bucket = unzipped_resources['bucket']
        source_folder = unzipped_resources['folder']

        expected_file = self.getExpectedFile()
        if expected_file not in filelist:
            raise Exception("Cannot find expected file: " + expected_file)

        source_file = self.createLambdaS3Location(source_folder, expected_file)
        self.code_pipeline_s3.Object(
            war_location['bucket'],
            war_location['key']
        ).put(
            Body=self.lambda_s3.Object(source_bucket, source_file).get()['Body'].read(),
            ServerSideEncryption='aws:kms'
        )

    def getLambdaS3Resource(self):
        """
        Get an s3.resource that has permissions to the dedicated s3 space for the wrapper
        lambda function
        """
        return boto3.resource('s3')

    def getCodePipelineS3Resource(self, job_data):
        """
        Create an s3.resource using the given AWS credentials issued by the code
        pipeline. These credentials restrict access to the code pipeline bucket to only
        the input artifacts and output artifacts.

        Uses the credentials passed in the event by CodePipeline. These
        credentials can be used to access the artifact bucket.

        Args:
            job_data: The job data structure

        Returns:
            An S3.resource with the appropriate credentials

        Taken from: http://docs.aws.amazon.com/codepipeline/latest/userguide/actions-invoke-lambda-function.html#actions-invoke-lambda-function-json-event-example

        """
        key_id = job_data['artifactCredentials']['accessKeyId']
        key_secret = job_data['artifactCredentials']['secretAccessKey']
        session_token = job_data['artifactCredentials']['sessionToken']

        session = Session(
            aws_access_key_id=key_id,
            aws_secret_access_key=key_secret,
            aws_session_token=session_token
        )

        return session.resource('s3', config=botocore.client.Config(signature_version='s3v4'))
