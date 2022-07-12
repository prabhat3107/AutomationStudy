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

data "vsphere_virtual_machine" "vm_templeate" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.dc_name.id
} 

module "vm_path" {
  source = "../paths"
  vsphere_parent_folder_name = var.vsphere_parent_folder_name
  vsphere_project_folder_name = var.vsphere_project_folder_name
  vsphere_datacenter_id = data.vsphere_datacenter.dc_name.id

}




resource "vsphere_virtual_machine" "vm_instance" {
  name             = "${var.vm_name}"
  num_cpus         = 2
  memory           = 4096
  folder           = module.vm_path.vsphere_project_folder_path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.vm_templeate.guest_id
  firmware         = data.vsphere_virtual_machine.vm_templeate.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.vm_network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "${var.vm_name}.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.vm_templeate.id

    customize {
      linux_options {
        host_name = "${var.vm_name}"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.100"
        ipv4_netmask    = 24

      }
      dns_server_list = ["10.1.1.1"]
      dns_suffix_list = ["sriauronet.local"]
      ipv4_gateway = "10.1.1.1"
    }
  }

  connection {
    type = "ssh"
    user = "prabhat"
    password = var.password
    host = vsphere_virtual_machine.vm_instance.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install -y ansible ansible-lint vim"
    ]

    
  }

  # Execute script on remote vm after this creation
  #provisioner "remote-exec" {
  #  script = "scripts/example-script.sh"
  #  connection {
  #    type     = "ssh"
  #    user     = "root"
  #    password = "VMware1!"
  #    host     = vsphere_virtual_machine.demo.default_ip_address 
  #  }
  #}
}
