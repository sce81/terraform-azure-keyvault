variable "name" {}
variable "resource_group" {}
variable "environment" {}
variable "key_name" {}
variable "key_permissions" {
  type    = list(string)
  default = []
}
variable "secret_permissions" {
  type    = list(string)
  default = []
}
variable "storage_permissions" {
  type    = list(string)
  default = []
}
variable "extra_tags" {
  type    = map(any)
  default = {}
}
variable "kv_access_policy" {
  description = "map of routing configuration "
  type = list(object({
    keyvault_id        = optional(string)
    object_id          = optional(string)
    application_id     = optional(string)
    key_permissions    = optional(list(string))
    secret_permissions = optional(list(string))
  }))
  default = []
}
variable "sku_name" { default = "standard" }
variable "purge_protection" { default = false }
variable "retention_days" { default = 7 }
variable "disk_encryption" { default = true }
variable "enabled_for_deployment" { default = true }