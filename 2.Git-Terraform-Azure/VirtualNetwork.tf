resource "azurerm_virtual_network" "Anil-vnet1" {
  name                = "Anil-vnet1"
  location            = azurerm_resource_group.Anil-rg1.location
  resource_group_name = azurerm_resource_group.Anil-rg1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
 subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}