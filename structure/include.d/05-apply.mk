#!/usr/bin/make -f

.PHONY: apply apply-actual apply-plan apply-plan-actual

# initialize, get modules, apply actual, push
apply: init get apply-actual push

apply-actual:
	terraform apply -no-color -input=false -refresh=true -parallelism=$(TERRAFORM_PARALLELISM) .

# initialize, get modules, apply plan actual, push
apply-plan: init get apply-plan-actual push

apply-plan-actual:
	terraform apply -no-color -input=false -refresh=true -parallelism=$(TERRAFORM_PARALLELISM) $(TERRAFORM_PLAN_FILE)
