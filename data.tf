data "azurerm_resource_group" "main" {
  name = var.resource_group
}
data "azurerm_client_config" "current" {
}

locals {
  common_tags = tomap({
    Environment = var.environment
    Terraform   = "true"
  })
}