data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "Anil-kw" {
  name                = "Anil-kw"
  resource_group_name = "Common-RG"
}

resource "azurerm_key_vault_access_policy" "Anil-kw-sp-access" {
  key_vault_id = data.azurerm_key_vault.Anil-kw.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set",
    "Delete",
    "Recover"
  ]
}
