import unittest
import os

from unzip_package import file_manager

class TestArtifact(unittest.TestCase):
    def test_getS3LocationFromArtifact_success(self):
        artifact = {
            'location': {
                'type': file_manager.Artifact.S3_TYPE,
                's3Location': {
                    'bucketName': 'foo',
                    'objectKey': 'bar',
                }
            }
        }

        artifactObj = file_manager.Artifact(artifact)
        result = artifactObj.getS3Location()
        expected = {
            'bucket': 'foo',
            'key': 'bar',
        }
        self.assertEqual(expected, result)


class TestManager(unittest.TestCase):
    def test_getSourceZipLocation_success(self):
        artifact = {
            'location': {
                'type': file_manager.Artifact.S3_TYPE,
                's3Location': {
                    'bucketName': 'foo',
                    'objectKey': 'bar',
                }
            },
            'name': 'SourceZip'
        }

        manager = file_manager.Manager({})
        result = manager.getSourceZipLocation(artifact)
        expected = {
            'bucket': 'foo',
            'key': 'bar',
        }
        self.assertEqual(expected, result)

    def test_createLambdaS3Location_expected(self):
        target_folder = "foo"
        filename = "bar"
        expected = os.path.join(
            file_manager.Manager.DEFAULT_ROOT_TARGET_FOLDER,
            target_folder,
            filename
        )
        manager = file_manager.Manager({})
        self.assertEqual(expected, manager.createLambdaS3Location(target_folder, filename))

if __name__ == '__main__':
    unittest.main()
