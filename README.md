# Multi-Cloud Retail Platform

**3+ Years Experience Level** Multi-Cloud DevOps Project using **Jenkins CI/CD**

## Project Overview
Yeh project real-time retail application (jaise POS system) ko multi-cloud environment mein deploy karta hai. Main isme **Terraform**, **Docker**, **Kubernetes** aur **Jenkins** use kiya hai.

## Key Responsibilities & Achievements
- Modular Terraform code likh kar Azure, GCP aur AWS pe infrastructure provision kiya
- End-to-End **Jenkins Pipeline** banaya (Build → Security Scan → Deploy)
- Azure AKS cluster pe production-grade deployment automate kiya
- Trivy se Docker image scanning implement kiya
- Free tier resources ka optimization kiya

## Tech Stack
- **IaC**: Terraform (Multi-cloud modules)
- **CI/CD**: Jenkins (Declarative Pipeline)
- **Container**: Docker
- **Orchestration**: Kubernetes (AKS)
- **Clouds**: Azure (Primary), GCP & AWS (Secondary)
- **App**: Node.js Express Retail Application

## Jenkins Pipeline Stages
1. Code Checkout
2. Docker Image Build
3. Trivy Security Scan
4. Push to Docker Hub
5. Deploy to Azure AKS

## How to Run
```bash
# Terraform
cd terraform
terraform init
terraform apply

# Jenkins
# Create Pipeline job and point to this repository
