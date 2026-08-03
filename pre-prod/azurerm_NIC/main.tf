resource "azurerm_network_interface" "network_interface" {
    for_each = var.nics
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetdata[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pubip[each.key].id
  }
}

data "azurerm_subnet" "subnetdata" {
  for_each=var.nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name

}

data "azurerm_public_ip" "pubip" {
  for_each= var.nics
  name                =each.value.pubip
  resource_group_name = each.value.rg_name
}
