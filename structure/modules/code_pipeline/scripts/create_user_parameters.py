#!/usr/bin/env python
import json
import argparse

def main():
    parser = argparse.ArgumentParser(
        description="Create json dump for user parameters"
    )
    parser.add_argument('-b', '--bucket-name', type=str, required=True)
    parser.add_argument('-e', '--expected-file', type=str, required=True)
    args = parser.parse_args()

    bucket_name = args.bucket_name
    expected_file = args.expected_file

    data = {
        'bucket_name': bucket_name,
        'expected_file': expected_file,
    }

    print(json.dumps(data))

if __name__ == '__main__':
    main()
