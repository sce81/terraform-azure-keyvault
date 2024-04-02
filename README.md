# terraform-azure-keyvault
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use. 


## Usage

module "example" {
source = "git@github.com:sce81/terraform-azure-keyvault.git"
  name                = "example"
  environment         = "dev"
  resource_group      = data.azurerm_resource_group.example.name
  key_permissions     = ["Write", "Get", "List", "Recover", "Delete"]
  secret_permissions  = ["Write", "Get", "List", "Set", "Recover", "Delete"]
  storage_permissions = ["Write", "Get", "List", "Recover", "Delete"]
  kv_access_policy    = local.kv_access_policy
  key_name            = "example-key"
}


### Prerequisites

Terraform ~> 1.7.0  

### Tested

Terraform ~> 1.7.0  

### Outputs

name:                   = azurerm_key_vault.main.name
id:                     = azurerm_key_vault.main.id