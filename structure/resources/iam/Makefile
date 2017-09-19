#!/usr/bin/make -f

TFPROJECT:=.

# NOTE: since these resources are deployed across accounts, separate state files must be maintained for each account

# this gets the account id from the current user's ARN, you must have the AWS CLI and jq installed
AWS_ACCOUNT_ID:=$(shell aws iam get-user | jq -r '.User.Arn' | awk -F ':' '{print $$5;}')

AWS_ACCOUNT_886703752586:="staging"
AWS_ACCOUNT_202004573189:="preprod"
AWS_ACCOUNT_284224159432:="production 2.0"
AWS_ACCOUNT_058144102190:="production 3.0"

AWS_ACCOUNT_FRIENDLY:=$(AWS_ACCOUNT_$(AWS_ACCOUNT_ID))

all: help

help:
	@echo "Read the source."

sanity:
ifdef AWS_ACCOUNT_FRIENDLY
	@echo
	@echo "OPERATING IN THE CURRENT ACCOUNT:"
	@echo "AWS Account ID: $(AWS_ACCOUNT_ID) - $(AWS_ACCOUNT_FRIENDLY)"
	@echo "Please validate that this is correct. Sleeping for 10 seconds."
	@echo
	@sleep 10
else
	@echo "ERROR: No AWS Account Credentials Present."
	@false
endif

init: fetch

fetch:
	# setup remote state
	terraform remote config -backend=s3 \
		-backend-config="bucket=isre.grindr.io" \
		-backend-config="key=terraform/resources/iam-$(AWS_ACCOUNT_ID).tfstate" \
		-backend-config="region=us-east-1" \

pull:
	terraform remote pull

get-modules:
	terraform get ${TFPROJECT}

plan: pull get-modules
	terraform plan ${TFPROJECT}

apply: sanity pull get-modules
	terraform apply ${TFPROJECT}

push:
	terraform remote push

show:
	terraform show

output: sanity pull
	terraform output
