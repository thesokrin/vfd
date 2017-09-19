import unittest
import os

from unzip_package import code_pipeline


class TestEvent(unittest.TestCase):
    def test_getCodePipelineParam_success(self):
        job = {
            'somekey': 'value'
        }
        event = {
            'CodePipeline.job': job
        }
        eventObj = code_pipeline.Event(event)
        result = eventObj.getCodePipeline()
        self.assertEqual(job, result.code_pipeline_job)

    def test_getCodePipelineParam_failure_notdict(self):
        event = ""
        with self.assertRaises(Exception):
            code_pipeline.Event(event)

    def test_getCodePipelineParam_failure_missingkey(self):
        event = {}
        with self.assertRaises(Exception):
            eventObj = code_pipeline.Event(event)
            eventObj.getCodePipelineParam()


class TestCodePipelineJob(unittest.TestCase):
    def test_getDataFromJob_success(self):
        data = {}
        job = {
            'data': data
        }
        pipeline_job = code_pipeline.CodePipelineJob(job)
        result = pipeline_job.getDataFromJob()
        self.assertEqual(data, result)

    def test_getDataFromJob_failure_notdict(self):
        data = "data"
        job = {
            'data': data
        }
        with self.assertRaises(Exception):
            pipeline_job = code_pipeline.CodePipelineJob(job)
            pipeline_job.getDataFromJob()

    def test_getDataFromJob_failure_missingkey(self):
        job = {}
        with self.assertRaises(Exception):
            pipeline_job = code_pipeline.CodePipelineJob(job)
            pipeline_job.getDataFromJob()

    def test_getInputArtifacts_success(self):
        artifacts = []
        data = {
            'inputArtifacts': artifacts
        }
        job = {
            'data': data
        }
        pipeline_job = code_pipeline.CodePipelineJob(job)
        result = pipeline_job.getInputArtifacts()
        self.assertEqual(artifacts, result)

    def test_getOutputArtifacts_success(self):
        artifacts = []
        data = {
            'outputArtifacts': artifacts
        }
        job = {
            'data': data
        }
        pipeline_job = code_pipeline.CodePipelineJob(job)
        result = pipeline_job.getOutputArtifacts()
        self.assertEqual(artifacts, result)

    def test_getActionConfiguration_success(self):
        artifacts = []
        data = {
            'actionConfiguration': artifacts
        }
        job = {
            'data': data
        }
        pipeline_job = code_pipeline.CodePipelineJob(job)
        result = pipeline_job.getActionConfiguration()
        self.assertEqual(artifacts, result)

    def test_getArtifact_success(self):
        expected = {
            'name': 'foo',
            'value': 'bar',
        }
        artifacts = [
            expected,
            {
                'name': 'baz',
                'value': 'gar',
            }
        ]

        pipeline_job = code_pipeline.CodePipelineJob({})
        result = pipeline_job.getArtifact(artifacts, 'foo')
        self.assertEqual(expected, result)

if __name__ == '__main__':
    unittest.main()
