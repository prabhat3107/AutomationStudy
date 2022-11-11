//This is a module to create VMs 
//this requires bellow parameters to be passed from the calling code.

terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    vsphere = {
        source = "hashicorp/vsphere"
        version = "~> 2.2.0"
    }
  }
}

locals {

  nic_list = [
    {"network_id": var.vm_nic1_network_id, "adapter_type" = var.template_network_interface_types },
    {"network_id": var.vm_nic2_network_id, "adapter_type" = var.template_network_interface_types },
    {"network_id": var.vm_nic3_network_id, "adapter_type" = var.template_network_interface_types }
  ]

}


//This creates a new VM by cloning from a VM template. The template's ID is passed to inputvariable

resource "vsphere_virtual_machine" "vm" {

  name                              = "${var.vm_name}"
  folder                            = var.project_folder_name 
  resource_pool_id                  = var.resource_pool_id
  datastore_id                      = var.datastore_id
  num_cpus                          = var.vm_num_cpus
  memory                            = var.vm_memory
  guest_id                          = var.template_guest_id
  scsi_type                        = var.template_scsi_type
  firmware                          = var.template_firmware 
dynamic network_interface {

  for_each = [ for nic in local.nic_list: nic ]
  content {
    network_id = network_interface.value.network_id
    adapter_type = network_interface.value.adapter_type
  }
  
}

  disk {
    label = "${var.disk_label}"
    size = var.template_disks_0_size
    thin_provisioned = var.template_disks_0_thin_provisioned
  }

  clone {
    template_uuid = var.vm_template_id
    customize {
      linux_options {
        host_name = "${var.vm_host_name}"
        domain = "${var.vm_domain_name}"
      }

      dynamic network_interface {

        for_each = [ for nic in var.vm_nic_config: nic ]
        content {
          ipv4_address = network_interface.value.ipv4_address
          ipv4_netmask = network_interface.value.ipv4_netmask
          }  
      }
      dns_server_list = var.dns_server_list
      dns_suffix_list = var.dns_suffix_list
      ipv4_gateway = var.vm_ipv4_gateway     

      }
  }


  connection {
    type = "ssh"
    user = var.vm_user_name
    password = var.vm_user_password
    host = vsphere_virtual_machine.vm.default_ip_address
  }
  provisioner "remote-exec" {

    inline = var.provisioning_commands

  }
}