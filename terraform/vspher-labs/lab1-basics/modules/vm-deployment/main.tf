
 data "vsphere_datacenter" "dc" {
     name = var.dc
 }

 data "vsphere_datastore" "datastore" {
     name = var.datastore
     datacenter_id = data.vsphere_datacenter.dc.id
   
 }
 data "vsphere_resource_pool" "pool" {
     name = var.resource_pool
     datacenter_id = data.vsphere_datacenter.dc.id
 }

data "vsphere_virtual_machine" "template_ubuntu_server" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
} 

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

 resource "vsphere_folder" "parent" {
     path = var.parent_folder
     type = "vm"
     datacenter_id = data.vsphere_datacenter.dc.id
   
 }

 resource "vsphere_folder" "Lab1-Basics" {
     path = "${vsphere_folder.parent.path}/Lab1-Basics"
     type = "vm"
     datacenter_id = data.vsphere_datacenter.dc.id
   
 }



resource "vsphere_virtual_machine" "tflab-userver1" {
  name             = "tflab-userver1"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "userver1.vmdk"
    size = "64"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server.id

    customize {
      linux_options {
        host_name = "userver1"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.101"
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
    host = vsphere_virtual_machine.tflab-userver1.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install -y ansible"
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
