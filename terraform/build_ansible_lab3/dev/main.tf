terraform {
    required_version = ">= 1.0.0 , < 2.0.0"
    required_providers {
      vsphere = {
        source = "hashicorp/vsphere"
        version = "~> 2.2.0"
      }
    }
}


provider "vsphere" {

    user = var.vcenter_user_name
    password = var.vcneter_user_password
    vsphere_server = var.vcenter_host_name
    allow_unverified_ssl = true
    
}

data "vsphere_datacenter" "dc_name" {

    name = var.dc_name
  
}

data "vsphere_resource_pool" "pool" {
     name = var.resource_pool
     datacenter_id = data.vsphere_datacenter.dc_name.id
 }

data "vsphere_datastore" "datastore" {
    name = var.vsphere_datastore_name
    datacenter_id = data.vsphere_datacenter.dc_name.id
  
}

data "vsphere_network" "vm_network" {

    name = var.vm_network_name
    datacenter_id = data.vsphere_datacenter.dc_name.id
 
}

data "vsphere_virtual_machine" "vm_template" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.dc_name.id
} 

module "vm_path" {
  source = "../modules/paths"
  vsphere_parent_folder_name = var.vsphere_parent_folder_name
  vsphere_project_folder_name = var.vsphere_project_folder_name
  vsphere_datacenter_id = data.vsphere_datacenter.dc_name.id

}


module "create_vms" {

  source = "../modules/vm"
  for_each = { for vm in var.vm_list: vm.vm_name => vm}


  vm_name = "${each.value.vm_name}"
  vm_folder_path = module.vm_path.vsphere_project_folder_path
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.vm_template.guest_id
  firmware         = data.vsphere_virtual_machine.vm_template.firmware
  datastore_id     = data.vsphere_datastore.datastore.id  
  network_id       = data.vsphere_network.vm_network.id
  vm_template_id   = data.vsphere_virtual_machine.vm_template.id
  vm_domain        = var.vm_domain
  vm_ipv4_address  = "${each.value.vm_ipv4_address}"
  vm_ipv4_netmask   = var.vm_ipv4_netmask
  dns_server_list   = var.dns_server_list
  dns_suffix_list  = var.dns_suffix_list
  vm_ipv4_gateway  = var.vm_ipv4_gateway
  vm_user_name =  var.vm_user_name
  vm_user_password = var.vm_user_password

}

