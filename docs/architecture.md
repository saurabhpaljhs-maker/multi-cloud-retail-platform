# Architecture Diagram (Text-based)

## High-Level Design

[Internet / Load Balancer]
|
+-----+-----+
|           |
Azure AKS   GCP GKE     AWS EC2
(K8s)       (K8s)       (VM + Docker)
|           |           |
Retail App  Retail App   Retail App
(Node.js)   (Node.js)   (Node.js)
|           |           |
Prometheus  Prometheus   CloudWatch
+-------------+-----------+
Monitoring


## Components
- **Networking**: Separate VPCs/VNets per cloud
- **Compute**: Managed K8s (AKS/GKE) + VM (AWS)
- **Deployment**: GitHub Actions → Docker Hub → kubectl apply
- **Security**: Trivy scanning, resource limits, least privilege
- **Scalability**: Horizontal Pod Autoscaler ready

## Future Enhancements
- Add ArgoCD / Helm
- Implement Blue-Green deployment
- Add centralized logging (ELK)
- Cost monitoring & alerts
