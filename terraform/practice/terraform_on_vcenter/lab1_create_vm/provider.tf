provider "vsphere" {
  password = ""
  user     = ""
  user = var.vcenter_user_name
  password = var.vcneter_user_password
  vsphere_server = var.vcenter_host_name
  allow_unverified_ssl = true
}