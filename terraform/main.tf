}
terraform {
  required_version = ">= 1.9.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

provider "aws" {
  region = var.aws_region
}

# Root level modules
module "network" {
  source      = "./modules/network"
  environment = var.environment
  gcp_project = var.gcp_project
}

module "azure_aks" {
  source      = "./modules/azure-aks"
  location    = var.azure_location
  environment = var.environment
}

module "gcp_gke" {
  source      = "./modules/gcp-gke"
  region      = var.gcp_region
  project     = var.gcp_project
  environment = var.environment
}

module "aws_vm" {
  source      = "./modules/aws-vm"
  region      = var.aws_region
  environment = var.environment
}

output "azure_aks_kubeconfig" {
  value     = module.azure_aks.kubeconfig
  sensitive = true
}

output "gcp_gke_endpoint" {
  value = module.gcp_gke.endpoint
}

output "aws_vm_public_ip" {
  value = module.aws_vm.public_ip
}
