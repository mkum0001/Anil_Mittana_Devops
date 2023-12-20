resource "random_password" "password3" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  depends_on = [ azurerm_virtual_network.Anil-vnet1 ]
}
resource "random_password" "password2" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  depends_on = [ random_password.password3 ]
}
resource "random_password" "password1" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  depends_on = [ random_password.password2 ]
}