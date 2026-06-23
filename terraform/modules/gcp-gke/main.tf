variable "region" {
  type    = string
  default = "us-central1"
}

variable "project" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "google_container_cluster" "gke" {
  name               = "${var.environment}-retail-gke"
  location           = var.region
  initial_node_count = 1
  remove_default_node_pool = true
  project            = var.project

  node_pool {
    name       = "default"
    node_count = 1

    node_config {
      machine_type = "e2-micro"   # Free tier friendly
    }
  }

  tags = ["${var.environment}"]
}

output "endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "cluster_name" {
  value = google_container_cluster.gke.name
}
