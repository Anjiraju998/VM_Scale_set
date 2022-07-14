resource "azurerm_windows_virtual_machine_scale_set" "scaleset" {
  name                = var.vm
  resource_group_name = var.rg
  location            = var.location
  instances           = var.num
  admin_username      = var.vmuser_name
  admin_password      = var.user_password
  sku       = "Standard_F2"
   

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }


  os_disk {
    caching              = var.rights
    storage_account_type = var.storage
  }
  network_interface {
    name    = "example"
    primary = true
    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.vsubid
    }
  }
  
}
