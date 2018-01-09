resource "azurerm_network_interface" "net_if" {
  count = "${var.count}"

  "ip_configuration" {
    name                          = "${var.ip_config_name}"
    private_ip_address_allocation = "dynamic"
    subnet_id                     = "${var.subnet_id}"
  }

  location            = "${var.location}"
  name                = "${var.net_if_name}${count.index}"
  resource_group_name = "${var.res_group_name}"
}

resource "azurerm_managed_disk" "mdisk" {
  count                = "${var.count}"
  create_option        = "${var.disk_create_option}"
  disk_size_gb         = "${var.disk_size}"
  location             = "${var.location}"
  name                 = "${var.disk_name}${count.index}"
  resource_group_name  = "${var.res_group_name}"
  storage_account_type = "${var.disk_storage_type}"
}

resource "azurerm_virtual_machine" "my_vm" {
  count                 = "${var.count}"
  location              = "${var.location}"
  name                  = "${var.vm_name}${count.index}"
  network_interface_ids = ["${element(azurerm_network_interface.net_if.*.id, count.index)}"]

  storage_image_reference {
    offer     = "${var.vm_storage_img_offer}"
    publisher = "${var.vm_storage_img_publisher}"
    sku       = "${var.vm_storage_img_sku}"
    version   = "latest"
  }

  os_profile {
    admin_password = "${var.vm_admin_pwd}"
    admin_username = "${var.vm_admin_username}"
    computer_name  = "${var.vm_pc_name}"
  }

  resource_group_name = "${var.res_group_name}"

  storage_os_disk {
    create_option     = "FromImage"
    name              = "${var.vm_storage_os_name}${count.index}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
  }

  vm_size = "${var.vm_size}"

  storage_data_disk {
    lun             = 1
    name            = "${element(azurerm_managed_disk.mdisk.*.name, count.index)}"
    managed_disk_id = "${element(azurerm_managed_disk.mdisk.*.id, count.index)}"
    create_option   = "Attach"
    disk_size_gb    = "${element(azurerm_managed_disk.mdisk.*.disk_size_gb, count.index)}"
  }

  tags {
    environment = "${var.tags}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
