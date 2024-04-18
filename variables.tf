variable "name" {
  description = "Name of application"
  type        = string
}
variable "resource_group" {
  description = "Azure Resource Group name"
  type        = string
}
variable "environment" {
  description = "Name of environment"
  type        = string
}

variable "extra_tags" {
  type        = map(any)
  default     = {}
  description = "Map of additional tags to assign to component"
}
variable "ssh_key" {
  description = "SSH Private Key to upload to KeyVault"
  type        = string
  default     = null
}
variable "kv_access_policy" {
  description = "List of policies to assign to KeyVault"
  type = list(object({
    keyvault_id         = optional(string)
    object_id           = optional(string)
    application_id      = optional(string)
    key_permissions     = optional(list(string))
    secret_permissions  = optional(list(string))
    storage_permissions = optional(list(string))
  }))
  default = []
}
variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
  type        = string
  default     = "standard"
}
variable "purge_protection" {
  description = "Is Purge Protection enabled for this Key Vault?"
  type        = bool
  default     = false
}
variable "retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
  type        = number
  default     = 7
}
variable "disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = true
}
variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault"
  type        = bool
  default     = true
}

variable "storage_account" {
  description = "The ID of the Storage Account"
  type        = string
  default     = null
}