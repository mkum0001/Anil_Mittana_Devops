resource "azurerm_network_security_group" "Anil-nsg" {
  name                = "Anil-nsg"
  location            = azurerm_resource_group.Anil-rg1.location
  resource_group_name = azurerm_resource_group.Anil-rg1.name

  security_rule {
    name                       = "test1235"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
    owner= "ram"
  }
}