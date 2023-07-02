help:
	@echo "Run Boostrap to Create the AWS Dependencies"

bootstrap:
	bootstrap.sh

ci: tf_plan

tf_plan:
	terraform -chdir=environments/$(TF_ENV) init
	terraform -chdir=environments/$(TF_ENV) validate
	terraform -chdir=environments/$(TF_ENV) plan -out=tfplan

tf_apply:
	terraform -chdir=environments/$(TF_ENV) init
	terraform -chdir=environments/$(TF_ENV) apply -auto-approve