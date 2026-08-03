resource "azurerm_public_ip" "pip" {
    for_each = var.public_ips
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
  location            = each.value.pip_location
  allocation_method   = each.value.allocation_method

}