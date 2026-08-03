resource "azurerm_virtual_machine" "vm-1" {
    for_each = var.vms
  name                  = each.value.vm_name
  location              = each.value.vm_location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [data.azurerm_network_interface.nic_data[each.key].id]
  vm_size               = each.value.vm_size

  storage_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku        = "22_04-lts-gen2"
  version    = "latest"
}

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

data "azurerm_network_interface" "nic_data" {
  for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

