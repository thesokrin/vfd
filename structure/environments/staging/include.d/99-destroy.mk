#!/usr/bin/make -f

.PHONY: destroy destroy-actual

# initialize, get modules, destroy actual, push
destroy: init get destroy-actual push

destroy-actual:
	terraform destroy -force -no-color -parallelism=$(TERRAFORM_PARALLELISM)
