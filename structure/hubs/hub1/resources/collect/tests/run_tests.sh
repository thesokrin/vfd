#!/usr/bin/env bash

git_root=$(git rev-parse --show-toplevel)
cd ${git_root}/ansible

ansible-playbook -i inventory/ec2.py -e variable_host=collect*.hub.grindr.io  -e tests=${git_root}/hubs/hub1/resources/collect/tests degoss.yml
