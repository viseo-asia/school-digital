provider "azuread" {
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.project}"
  location            = var.location
  resource_group_name = var.resourceGroup
  dns_prefix          = "k8s-${var.project}"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2s_v3"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "learn"
  }
}

data "azuread_service_principal" "aks" {
  application_id = var.appId
}

data "azurerm_container_registry" "acr" {
  name = var.containerRegistry
  resource_group_name = var.resourceGroup
}

resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = data.azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azuread_service_principal.aks.id
  skip_service_principal_aad_check = true
}