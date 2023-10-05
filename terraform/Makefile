#########################################################################
# Terraform Makefile
#########################################################################
-include .env

SHELL := /bin/bash
BASE := $(shell /bin/pwd)
PIP ?= pip
TF ?= terraform
MAKE ?= make

AWS_PROFILE := app-deployer
VAR_FILE := $(BASE)/tf_$(ENVIRONMENT).tfvars

$(info AWS_ACCOUNT 			= $(AWS_ACCOUNT))
$(info AWS_REGION  			= $(AWS_REGION))
$(info STATE_BUCKET			= $(STATE_BUCKET))
$(info ENVIRONMENT 			= $(ENVIRONMENT))
$(info NICKNAME    			= $(NICKNAME))
$(info AWS_PROFILE 			= $(AWS_PROFILE))
$(info VAR_FILE 			= $(VAR_FILE))
$(info STATIC_BUCKET_NAME 	= $(STATIC_BUCKET_NAME))

lint:
	$(info [*] Linting terraform)
	@$(TF) fmt -check -diff -recursive
	@$(TF) validate

check_env:
	$(info [*] Check Environment Done)

init: check_env
	$(info [*] Init Terrafrom Infra)
	@$(TF) init -reconfigure \
		-backend-config="bucket=$(STATE_BUCKET)" \
		-backend-config="region=$(AWS_REGION)" \
		-backend-config="profile=$(AWS_PROFILE)" \
		-backend-config="key=$(NICKNAME)/$(ENVIRONMENT)/$(AWS_REGION)/terraform.tfstate"

plan: init
	$(info [*] Plan Terrafrom Infra)
	@$(TF) plan -var-file $(VAR_FILE) \
		-var="aws_profile=${AWS_PROFILE}" \
		-var="aws_region=${AWS_REGION}" \
		-var="static_bucket_name=${STATIC_BUCKET_NAME}" \
		-out tfplan

plan-destroy: init
	$(info [*] Plan Terrafrom Infra - Destroy)
	@$(TF) plan -destroy -var-file $(VAR_FILE) \
		-var="aws_profile=${AWS_PROFILE}" \
		-var="static_bucket_name=${STATIC_BUCKET_NAME}" \
		-out tfplan

apply: plan
	$(info [*] Apply Terrafrom Infra)
	@$(TF) apply tfplan

apply-destroy: plan-destroy
	$(info [*] Apply Terrafrom Infra - Destroy)
	@$(TF) apply tfplan