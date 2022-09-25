help:
	@echo make init
	@echo make deploy
	@echo make undeploy
	@echo make show
init: tf-init
	
deploy: tf-apply
undeploy: tf-destroy
show: tf-output

tf-init:
	terraform init

tf-apply:
	terraform apply #--auto-approve

tf-destroy:
	terraform destroy #--auto-approve

tf-output:
	terraform output
