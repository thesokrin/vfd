#!/usr/bin/make -f

.PHONY: init

init: validate
	@# initialize remote state if not present, pull otherwise
ifndef TERRAFORM_STATE_FILE
		terraform remote config -backend=s3 \
			-backend-config="bucket=isre.grindr.io" \
			-backend-config="key=terraform/$(ATLAS_PROJECT).tfstate" \
			-backend-config="region=us-east-1"
TERRAFORM_STATE_FILE:=.terraform/terraform.tfstate
else
		@terraform remote pull
endif
