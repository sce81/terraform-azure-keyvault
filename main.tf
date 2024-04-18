resource "azurerm_key_vault" "main" {
  name                        = "${var.name}${random_string.random.result}"
  location                    = data.azurerm_resource_group.main.location
  resource_group_name         = data.azurerm_resource_group.main.name
  enabled_for_disk_encryption = var.disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.retention_days
  purge_protection_enabled    = var.purge_protection
  sku_name                    = var.sku_name
  enabled_for_deployment      = var.enabled_for_deployment
}


resource "azurerm_key_vault_access_policy" "main" {
  count              = length(var.kv_access_policy)
  key_vault_id       = azurerm_key_vault.main.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.kv_access_policy[count.index].object_id
  application_id     = var.kv_access_policy[count.index].application_id
  key_permissions    = var.kv_access_policy[count.index].key_permissions
  secret_permissions = var.kv_access_policy[count.index].secret_permissions

  depends_on = [azurerm_key_vault.main]
}

resource "azurerm_key_vault_key" "main" {
  name         = "${var.name}-key"
  key_vault_id = azurerm_key_vault.main.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "wrapKey",
    "unwrapKey",
  ]
  depends_on = [azurerm_key_vault_access_policy.main]
}

resource "random_string" "random" {
  length    = 6
  special   = false
  min_lower = 6
}


resource "azurerm_key_vault_secret" "private_key" {
  name         = "${var.name}-ssh-key"
  value        = var.ssh_key
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [azurerm_key_vault_access_policy.main]
}
