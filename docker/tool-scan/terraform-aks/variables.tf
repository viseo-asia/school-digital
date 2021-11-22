variable "location" {
  description = "Azure Region"
}

variable "resourceGroup" {
  description = "Azure Ressource Group tu use"
}

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "project" {
  description = "Project for this application"
}

variable "containerRegistry" {
  description = "Container Registry"
}
