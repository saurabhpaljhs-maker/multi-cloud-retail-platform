# Multi-Cloud Retail Platform

Production-grade **Multi-Cloud DevOps** project showcasing **3+ years of experience** as Multicloud DevOps Engineer (HCL Tech).

## Project Overview
End-to-end automation for a Retail/POS application deployed across multiple clouds using Infrastructure as Code and CI/CD.

## Key Achievements
- Designed modular Terraform configurations for AWS, Azure & GCP
- Implemented end-to-end CI/CD pipeline using GitHub Actions
- Containerized and deployed microservice on Azure AKS & GCP GKE
- Integrated security scanning (Trivy) in pipeline
- Achieved automated deployments with zero manual intervention

## Tech Stack
- **IaC**: Terraform (Multi-Cloud Modules)
- **CI/CD**: GitHub Actions
- **Container**: Docker
- **Orchestration**: Kubernetes (AKS + GKE)
- **Clouds**: Azure (Primary), GCP, AWS
- **Application**: Node.js Retail App

## Pipeline Features
- Docker Build
- Trivy Security Scan
- Push to Docker Hub
- Deploy to Azure AKS

## How to Deploy
```bash
cd terraform
terraform init
terraform apply
