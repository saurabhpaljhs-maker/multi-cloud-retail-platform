terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 4.0" }
    google  = { source = "hashicorp/google", version = "~> 6.0" }
    aws     = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {}  # Use AWS S3 or Azure storage
}

provider "azurerm" { features {} }
provider "google" { project = var.gcp_project }
provider "aws" { region = var.aws_region }