resource "azurerm_key_vault" "main" {
  name                        = "${var.name}${substr(data.azurerm_client_config.current.tenant_id, -12, -1)}a"
  location                    = data.azurerm_resource_group.main.location
  resource_group_name         = data.azurerm_resource_group.main.name
  enabled_for_disk_encryption = var.disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.retention_days
  purge_protection_enabled    = var.purge_protection
  sku_name                    = var.sku_name
}


resource "azurerm_key_vault_access_policy" "main" {
  count              = length(var.kv_access_policy)
  key_vault_id       = azurerm_key_vault.main.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.kv_access_policy[count.index].object_id
  application_id     = var.kv_access_policy[count.index].application_id
  key_permissions    = var.kv_access_policy[count.index].key_permissions
  secret_permissions = var.kv_access_policy[count.index].secret_permissions
}