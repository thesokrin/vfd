#!/usr/bin/make -f

SHELL := /bin/bash

# current AWS account id
AWS_ACCOUNT_ID:=$(shell aws iam get-user | jq -r .User.Arn | awk -F : '{print $$5;}')

# account ids to look up names for
AWS_ACCOUNT_780453558463:="dev"
AWS_ACCOUNT_886703752586:="staging"
AWS_ACCOUNT_202004573189:="preprod"
AWS_ACCOUNT_284224159432:="prod-2.0"
AWS_ACCOUNT_058144102190:="prod-3.0"

# set the aws account name
AWS_ACCOUNT_NAME:=$(AWS_ACCOUNT_$(AWS_ACCOUNT_ID))

# lookup git metadata
GIT_BASE_DIR:=$(shell git rev-parse --show-toplevel)
GIT_BRANCH:=$(shell git symbolic-ref -q --short HEAD || echo ${TRAVIS_BRANCH:-unknown})
GIT_COMMIT:=$(shell git rev-parse HEAD)
GIT_COMMIT_SHORT:=$(shell git rev-parse --short HEAD)

# define atlas project path
ATLAS_PROJECT:=$(shell echo $$(pwd) | sed "s|^$$(git rev-parse --show-toplevel)||" | cut -b 2-)

TERRAFORM_VERSION:=$(shell terraform version | head -1 | grep -oP '(?<=v)(\d+\.\d+\.\d+)')
REQUIRED_TERRAFORM_VERSION:=$(shell awk '/^terraform_version:/ {print $$2}' $(GIT_BASE_DIR)/ansible/roles/terraform/vars/main.yml | tr -d \")

TERRAFORM_STATE_FILE:=$(shell find .terraform/terraform.tfstate -mindepth 0 -maxdepth 1 2>/dev/null)
TERRAFORM_PARALLELISM=20
TERRAFORM_PLAN_FILE:=.terraform/terraform.tfplan
TERRAFORM_PLAN_FILE_TEXT:=.terraform/terraform.tfplan.txt
