variable "subnet_id" {
  type        = string
  description = "The ID of the subnet resource"
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP resource"
}

variable "ssh_key" {
  type        = string
  description = "The public SSH key to connect to the cluster"
  sensitive   = true
}

variable "rg_name" {
  type        = string
  description = "The name of the Azure resource group"
}

variable "rg_location" {
  type        = string
  description = "The location of the Azure resource group"
}
