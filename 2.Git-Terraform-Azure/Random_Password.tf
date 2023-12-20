resource "random_password" "password3" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "random_password" "password2" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "random_password" "password1" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}