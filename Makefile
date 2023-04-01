git:
	git pull

dev-apply: git
	terraform init -backend-config=enc-dev/state.tfvars
	terraform apply -auto-approve -var-file=end-dev/main.tfvars

dev-destroy: git
	terraform destroy -auto-approve -var-file=end-dev/main.tfvars
