#!/usr/bin/make -f

# pin to this account id
AWS_ACCOUNT:=284224159432
# account friendly name
AWS_ACCOUNT_NAME:=2.0

# set to the atlas project path
ATLAS_PROJECT:=resources/s3/rpm.grindr.io

# fetch the current AWS account id
CURRENT_ACCOUNT:=$(shell aws iam get-user | jq -r .User.Arn | awk -F : '{print $$5;}')
TFPROJECT:=.

all: help

help:
	@echo "Read the source."

init:
	# setup remote state
	terraform remote config -backend=s3 \
		-backend-config="bucket=isre.grindr.io" \
		-backend-config="key=terraform/${ATLAS_PROJECT}.tfstate" \
		-backend-config="region=us-east-1"

validate:
ifneq "$(CURRENT_ACCOUNT)" "$(AWS_ACCOUNT)"
	@echo "ERROR: The IAM account being used is not in the ${AWS_ACCOUNT_NAME} account."
	@exit 1
else
	@echo "Validated account information."
	@echo
endif

get-modules:
	terraform get ${TFPROJECT}

plan: validate get-modules
	terraform plan ${TFPROJECT}

apply: validate get-modules
	terraform apply ${TFPROJECT}

push: validate
	terraform remote push

pull: validate
	terraform remote pull

show:
	terraform show

output:
	terraform output
