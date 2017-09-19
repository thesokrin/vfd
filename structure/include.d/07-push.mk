#!/usr/bin/make -f

push: init
	@terraform remote push
