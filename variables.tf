variable "ip_config_name" {
  description = "IP Configuration Name"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "location" {
  description = "Location"
}

variable "net_if_name" {
  description = "Network Interface Name"
}

variable "disk_create_option" {
  description = "Disk Create Option"
}

variable "disk_size" {
  description = "Disk Size (in GBs)"
}

variable "disk_name" {
  description = "Disk Name"
}

variable "res_group_name" {
  description = "Resource Group Name"
}

variable "disk_storage_type" {
  description = "Disk Storage Type"
}

variable "vm_name" {
  description = "Virtual Machine Name"
}

variable "count" {
  description = "Virtual Machine Count"
}

variable "vm_admin_username" {
  description = "VM Admin Username"
}

variable "vm_admin_pwd" {
  description = "VM Admin Password"
}

variable "vm_pc_name" {
  description = "VM Computer Name"
}

variable "vm_size" {
  description = "VM Size"
}

variable "vm_storage_img_offer" {
  description = "VM Storage Image Offer"
}

variable "vm_storage_img_publisher" {
  description = "VM Storage Image Publisher"
}

variable "vm_storage_img_sku" {
  description = "VM Storage Image SKU"
}

variable "vm_storage_os_name" {
  description = "VM Storage OS Disk Name"
}

variable "tags" {
  description = "VM Environment Tag"
}
