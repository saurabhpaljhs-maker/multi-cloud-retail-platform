variable "location" {
  type    = string
  default = "East US"
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.environment}-retail-aks"
  location            = var.location
  resource_group_name = "${var.environment}-retail-rg"
  dns_prefix          = "${var.environment}-retail-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"   # Free tier friendly
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}

output "kubeconfig" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
