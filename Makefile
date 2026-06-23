.PHONY: help terraform-init terraform-plan terraform-apply docker-build docker-push

help:
	@echo "Multi-Cloud Retail Platform Makefile"
	@echo "make terraform-init     - Initialize Terraform"
	@echo "make terraform-plan     - Show Terraform plan"
	@echo "make docker-build       - Build Docker image"
	@echo "make docker-push        - Push Docker image"

terraform-init:
	cd terraform && terraform init

terraform-plan:
	cd terraform && terraform plan

terraform-apply:
	cd terraform && terraform apply -auto-approve

docker-build:
	docker build -t retail-app:latest ./app

docker-push:
	docker tag retail-app:latest $${DOCKERHUB_USERNAME}/retail-app:latest
	docker push $${DOCKERHUB_USERNAME}/retail-app:latest
