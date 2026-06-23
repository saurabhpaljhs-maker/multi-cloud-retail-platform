variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "azure_location" {
  type    = string
  default = "East US"
}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}

variable "gcp_project" {
  type        = string
  description = "Your GCP Project ID"
}

variable "environment" {
  type    = string
  default = "dev"
}
