from __future__ import print_function
import sys
import boto3
import botocore
import os
import urllib
import zipfile
from boto3.session import Session


class Event():
    CODE_PIPELINE_JOB_KEY = 'CodePipeline.job'

    def __init__(self, event):
        self.initialize(event)

    def initialize(self, event):
        if not isinstance(event, dict):
            raise Exception("Invalid event object passed in, not a dict")

        self.event = event

    def getCodePipeline(self):
        event = self.event
        if self.CODE_PIPELINE_JOB_KEY not in event:
            raise Exception("Invalid event object passed in, missing CodePipeline.job key")

        code_pipeline_job = event[self.CODE_PIPELINE_JOB_KEY]
        if not isinstance(code_pipeline_job, dict):
            raise Exception("Invalid code_pipeline_job object passed in, not a dict")

        return CodePipelineJob(code_pipeline_job)


class CodePipelineJob():
    ARTIFACT_KEY_NAME = 'name'

    def __init__(self, code_pipeline_job):
        self.code_pipeline_job = code_pipeline_job

    def getData(self):
        code_pipeline_job = self.code_pipeline_job
        if 'data' not in code_pipeline_job:
            raise Exception("Invalid code_pipeline_job object passed in, missing data key")

        data = code_pipeline_job['data']
        if not isinstance(data, dict):
            raise Exception("Invalid data object found, not a dict")

        return data

    def getInputArtifacts(self):
        data = self.getData()
        if 'inputArtifacts' not in data:
            raise Exception("Invalid data object found, missing inputArtifacts key")

        return data['inputArtifacts']

    def getOutputArtifacts(self):
        data = self.getData()
        if 'outputArtifacts' not in data:
            raise Exception("Invalid data object found, missing outputArtifacts key")

        return data['outputArtifacts']

    def getActionConfiguration(self):
        data = self.getData()

        if 'actionConfiguration' not in data:
            raise Exception("Invalid data object found, missing actionConfiguration key")

        return data['actionConfiguration']

    def getUserParameters(self):
        action_configuration = self.getActionConfiguration()
        if 'configuration' not in action_configuration:
            raise Exception("Invalid action configuration, no 'configuration' key")

        configuration = action_configuration['configuration']
        if 'UserParameters' not in configuration:
            raise Exception("Invalid configuration, no 'UserParameters' key")

        return configuration['UserParameters']

    def getArtifact(self, artifacts, artifact_name):
        artifact = next((item for item in artifacts if item[self.ARTIFACT_KEY_NAME] == artifact_name), None)

        if not artifact:
            raise Exception("No artifact found for " + artifact_name)

        return artifact
