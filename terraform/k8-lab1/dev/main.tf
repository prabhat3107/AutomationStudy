

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
     name = var.resource_pool_name
     datacenter_id = data.vsphere_datacenter.dc_name.id
 }

data "vsphere_datastore" "datastore" {
    name = var.vsphere_datastore_name
    datacenter_id = data.vsphere_datacenter.dc_name.id
  
}

data "vsphere_network" "vm_network_1" {

    name = var.vm_network_name_1
    datacenter_id = data.vsphere_datacenter.dc_name.id
 
}
data "vsphere_network" "vm_network_2" {

    name = var.vm_network_name_2
    datacenter_id = data.vsphere_datacenter.dc_name.id
 
}
data "vsphere_network" "vm_network_3" {

    name = var.vm_network_name_3
    datacenter_id = data.vsphere_datacenter.dc_name.id
 
}

data "vsphere_network" "vm_network_4" {

    name = var.vm_network_name_4
    datacenter_id = data.vsphere_datacenter.dc_name.id
 
}
data "vsphere_virtual_machine" "vm_template" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.dc_name.id
} 

module "vm_path" {
  source = "../modules/vm-folder"
  parent_project_folder_name = var.parent_project_folder_name
  project_folder_name = var.project_folder_name
  vsphere_datacenter_id = data.vsphere_datacenter.dc_name.id

}

module "create_vms" {

  source = "../modules/clone_vm"
  for_each = { for vm in var.vm_list: vm.vm_name => vm }


  vm_name = "${each.value.vm_name}"
  project_folder_name = module.vm_path.project_folder_path
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id 
  vm_num_cpus      = each.value.vm_num_cpus
  vm_memory        = each.value.vm_memory
  template_guest_id = data.vsphere_virtual_machine.vm_template.guest_id
  template_firmware = data.vsphere_virtual_machine.vm_template.firmware
  template_scsi_type = data.vsphere_virtual_machine.vm_template.scsi_type
 
  vm_template_id   = data.vsphere_virtual_machine.vm_template.id
  vm_nic1_network_id       = data.vsphere_network.vm_network_1.id
  vm_nic2_network_id       = data.vsphere_network.vm_network_2.id
  vm_nic3_network_id       = data.vsphere_network.vm_network_3.id
  template_network_interface_types = data.vsphere_virtual_machine.vm_template.network_interface_types[0]
  disk_label = "${each.value.vm_name}"
  template_disks_0_size = data.vsphere_virtual_machine.vm_template.disks.0.size
  template_disks_0_thin_provisioned = data.vsphere_virtual_machine.vm_template.disks.0.thin_provisioned
  vm_host_name        = "${each.value.vm_name}"
  vm_domain_name = var.vm_domain_name
  vm_nic_config  = each.value.vm_nic_config
  dns_server_list   = var.dns_server_list
  dns_suffix_list  = var.dns_suffix_list
  vm_ipv4_gateway  = var.vm_ipv4_gateway
  vm_user_name =  var.vm_user_name
  vm_user_password = var.vm_user_password
  provisioning_commands = var.provisioning_commands


}

