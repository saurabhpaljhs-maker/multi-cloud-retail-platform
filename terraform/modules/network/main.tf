[200~variable "environment" {
  type    = string
  default = "dev"
}

# Azure Network
resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-retail-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-retail-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# GCP Network
resource "google_compute_network" "vpc" {
  name                    = "${var.environment}-retail-vpc"
  auto_create_subnetworks = false
  project                 = var.gcp_project
}

# AWS Network
resource "aws_vpc" "vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name        = "${var.environment}-retail-vpc"
    Environment = var.environment
  }
}
