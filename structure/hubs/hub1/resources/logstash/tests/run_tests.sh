#!/usr/bin/env bash

git_root=$(git rev-parse --show-toplevel)
cd ${git_root}/ansible

ansible-playbook -u isre -i inventory/ec2.py -e variable_host=tag_Name_logstash_hub_grindr_io  -e tests=${git_root}/hubs/hub1/resources/logstash/tests degoss.yml