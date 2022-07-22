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

  network_interface {
    network_id                      = var.vm_network_id
    adapter_type                    = var.template_network_interface_types

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

      network_interface {
        ipv4_address    = var.vm_ipv4_address
        ipv4_netmask    = var.vm_ipv4_netmask
      }
      dns_server_list = var.dns_server_list
      dns_suffix_list = var.dns_suffix_list
      ipv4_gateway = var.vm_ipv4_gateway     

    }
  }

}