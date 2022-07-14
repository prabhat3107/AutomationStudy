terraform {
    required_version = ">= 1.0.0 , < 2.0.0"
    required_providers {
      vsphere = {
        source = "hashicorp/vsphere"
        version = "~> 2.2.0"
      }
    }
}

/*Modules don't have a provider definition
provider "vsphere" {

    user = var.vcenter_user_name
    password = var.vcneter_user_password
    vsphere_server = var.vcenter_host_name
    allow_unverified_ssl = true
    
}
*/


resource "vsphere_virtual_machine" "vm_instance" {
  name             = "${var.vm_name}"
  num_cpus         = 2
  memory           = 4096
  folder           = var.vm_folder_path
  datastore_id     = var.datastore_id
  resource_pool_id = var.resource_pool_id
  guest_id         = var.guest_id
  firmware         = var.firmware

  # Set network parameters
  network_interface {
    network_id = var.network_id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "${var.vm_name}.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = var.vm_template_id

    customize {
      linux_options {
        host_name = "${var.vm_name}"
        domain    = var.vm_domain
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

  connection {
    type = "ssh"
    user = var.vm_user_name
    password = var.vm_user_password
    host = var.vm_ipv4_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.vm_user_password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.vm_user_password} | sudo -S apt install -y ansible ansible-lint vim"
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
