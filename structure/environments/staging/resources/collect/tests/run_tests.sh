#!/usr/bin/env bash

git_root=$(git rev-parse --show-toplevel)
cd ${git_root}/ansible

ansible-playbook -i inventory/ec2.py -e variable_host=tag_atlas_project_collect  -e tests=${git_root}/environments/staging/resources/collect/tests degoss.yml
