rgs = {
  rg1 = {
    rg_name     = "rg-practice"
    rg_location = "east us 2"
  }

  rg2 = {
    rg_name     = "rg-practice2"
    rg_location = "east us 2"
  }

  rg3 = {
    rg_name     = "rg-practice3"
    rg_location = "east us 2"
  }

    
}

vnets = {
  vnet1 = {
    vnet_name     = "vnet-practice"
    vnet_location = "east us 2"
    rg_name       = "rg-practice"
    address_space = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name      = "subnet_practice"
    rg_name          = "rg-practice"
    vnet_name        = "vnet-practice"
    address_prefixes = ["10.0.1.0/24"]

  }
}

public_ips = {
  public_ip1 = {
    public_ip_name    = "frontend"
    rg_name           = "rg-practice"
    pip_location      = "east us 2"
    allocation_method = "Static"


  }
}

nics = {
  nic1 = {
    nic_name     = "niccard"
    nic_location = "east us 2"
    rg_name      = "rg-practice"
    subnet_name  = "subnet_practice"
    vnet_name    = "vnet-practice"
    pubip        = "frontend"


  }
}


vms = {
  vm1 = {

    vm_name     = "Linuxvm"
    vm_location = "east us 2"
    rg_name     = "rg-practice"
    vm_size     = "Standard_D2s_v3"
    nic_name    = "niccard"
    

  }
}


