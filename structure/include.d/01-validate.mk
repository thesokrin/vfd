#!/usr/bin/make -f

.PHONY: validate validate-account validate-project

validate: validate-utilities validate-account validate-version validate-project

# validate AWS account credentials
validate-account:
	@# test for AWS_ACCOUNT_ID being defined; this is equivalent to being logged in
	@if [ -z "$(AWS_ACCOUNT_ID)" ]; then \
		echo "ERROR: You must have valid AWS credentials available." ; \
		exit 1 ; \
	fi
	@# test for account name being defined, this shows us we're in a known account
	@if [ -z "$(AWS_ACCOUNT_NAME)" ]; then \
		echo "ERROR: You are in an unknown account $(AWS_ACCOUNT_ID)." ; \
		exit 1 ; \
	fi
	@# check that AWS_ACCOUNT is declared
	@if [ -z "$(AWS_ACCOUNT)" ] ; then \
		echo "ERROR: Your project must declare AWS_ACCOUNT." ; \
		exit 1 ; \
	fi
	@# test for right account
	@if [ "$(AWS_ACCOUNT)" != "$(AWS_ACCOUNT_NAME)" ]; then \
		echo "ERROR: You are in the $(AWS_ACCOUNT_NAME) account, this project requires the $(AWS_ACCOUNT) account." ; \
		exit 1 ; \
	fi
	@echo "Validated AWS Account Information."


# validate that we have a legitimate atlas project path
validate-project:
	@# test that atlas project isn't empty
	@if [ -z "$(ATLAS_PROJECT)" ]; then \
		echo "ERROR: the path to the given Atlas Project is empty." ; \
		exit 1 ; \
	fi
	@echo "Validated Atlas Project Path as $(ATLAS_PROJECT)."


# validate that utilities are present
validate-utilities:
	@# test that we have the utilities that we need
	@if ! which aws jq terraform > /dev/null; then \
		echo "ERROR: the following utilities are required: aws cli, jq, and terraform" ; \
		exit 1 ; \
	fi


# validate that we have a legitimate version of terrorform
validate-version:
	@# test that we have the right version of terrorform
	@if [ "$(TERRAFORM_VERSION)" != "$(REQUIRED_TERRAFORM_VERSION)" ]; then \
  	echo "ERROR: You are running Terraform $(TERRAFORM_VERSION); $(REQUIRED_TERRAFORM_VERSION) is required." ; \
  	exit 1 ; \
	fi
	@echo "Validated Terraform Version is $(REQUIRED_TERRAFORM_VERSION)."
