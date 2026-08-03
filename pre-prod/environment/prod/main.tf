module "resource_group" {
    source = "../../azurerm_rg"
    rgs = var.rgs

  
}

module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../../azurerm_vnet"
    vnets = var.vnets

  
}

module "subnet" {
    depends_on = [ module.virtual_network ]

    source = "../../azurerm_subnet"

    subnets = var.subnets
  
}

module "pubip" {
    depends_on = [ module.resource_group ]

    source ="../../azurerm_public_IP"

    public_ips = var.public_ips

  
}

module "nic" {
    depends_on = [ module.subnet,module.pubip ]

    source = "../../azurerm_NIC"

    nics = var.nics

  
}
  

module "vm" {

depends_on = [ module.nic ]
    source = "../../azurerm_vm"

    vms=var.vms
  
}