variable "subscription_id" {
  type        = string
  description = "The subscription ID of the Azure account"
}

variable "client_id" {
  type        = string
  description = "The client ID of the Azure account"
}

variable "client_secret" {
  type        = string
  description = "The client secret of the Azure account"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the Azure account"
}

variable "ssh_key" {
  type        = string
  description = "The public SSH key to connect to the cluster"
  sensitive   = true
}

#variable "blob_key" {}
