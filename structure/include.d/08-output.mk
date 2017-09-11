#!/usr/bin/make -f

output: init
	@$(GIT_BASE_DIR)/bin/terraform-output $(TERRAFORM_STATE_FILE)
