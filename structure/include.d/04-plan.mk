#!/usr/bin/make -f

.PHONY: plan

plan: init get
	terraform plan -no-color -input=false -refresh=true -parallelism=$(TERRAFORM_PARALLELISM) \
		-out=$(TERRAFORM_PLAN_FILE) |& tee $(TERRAFORM_PLAN_FILE_TEXT)
