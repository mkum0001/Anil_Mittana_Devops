resource "azurerm_key_vault_secret" "password1" {
  name         = "password1"
  value        = random_password.password1.result
  key_vault_id = data.azurerm_key_vault.Anil-kw.id
  depends_on = [
    azurerm_key_vault_access_policy.Anil-kw-sp-access
  ]
}

resource "azurerm_key_vault_secret" "password2" {
  name         = "password2"
  value        = random_password.password2.result
  key_vault_id = data.azurerm_key_vault.Anil-kw.id
  depends_on = [
    azurerm_key_vault_access_policy.Anil-kw-sp-access
  ]
}

resource "azurerm_key_vault_secret" "password3" {
  name         = "password3"
  value        = random_password.password3.result
  key_vault_id = data.azurerm_key_vault.Anil-kw.id
  depends_on = [
    azurerm_key_vault_access_policy.Anil-kw-sp-access
  ]
}
