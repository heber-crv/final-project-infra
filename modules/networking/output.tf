output "subnet_id" {
  value = azurerm_subnet.main-subnet.id
}
output "public_ip_id" {
  value = azurerm_public_ip.lb-public-ip.id
}
