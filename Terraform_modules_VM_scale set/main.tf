module "configuration1" {
  source = "./NIC"
  nic = var.nic
  ipconfig = var.ipconfig
  vsubid = module.configuration4.vsubid
  location = var.loc
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./Resource_Group"
  resource_group = var.resource_group
  location = var.loc
}
module "configuration3" {
  source = "./VM"
  vm= var.vm
  vmuser_name = var.vmuser_name
  user_password = var.user_password
  vsubid = module.configuration4.vsubid
  rights = var.rights
  storage = var.storage
  location = var.loc
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
  num = var.noi
}
module "configuration4" {
  source = "./VNet"
  vnet = var.vnet
  cidr_block = var.cidr_block
  vsub = var.sub
  ip_address = var.ip_address
  location = var.loc
  rg = module.configuration2.rgid
}