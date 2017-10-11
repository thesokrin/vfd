#!/usr/bin/make -f

TFPROJECT:=.

all: help

help:
	@echo "Read the source."

init: fetch

fetch:
	# setup remote state
	terraform remote config -backend=s3 \
		-backend-config="bucket=isre.grindr.io" \
		-backend-config="key=terraform/resources/s3/isre.grindr.io.tfstate" \
		-backend-config="region=us-east-1"

get-modules:
	terraform get ${TFPROJECT}

plan: get-modules
	terraform plan ${TFPROJECT}

apply: get-modules
	terraform apply ${TFPROJECT}

push:
	terraform remote push

show:
	terraform show

outputs:
	terraform output -module hub
