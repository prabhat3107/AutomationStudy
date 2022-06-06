provider "vsphere" {
  # If you use a domain, set your login like this "Domain\\User"
  user           = "administrator@sriauronet.local"
  password       = "Beauty!123"
  vsphere_server = "vcenter1.sriauronet.local"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
data "vsphere_datacenter" "dc" {
  name = "SriAuronetHDC1"
}

# If you don't have any resource pools, put "/Resources" after cluster name
data "vsphere_resource_pool" "pool" {
  name          = "esxi-1.sriauronet.local/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve datastore information on vsphere
data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve network information on vsphere
data "vsphere_network" "network" {
  name          = "VMNet-G1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template_rhel8" {
  name          = "rhel8-server-t.sriauronet.local"
  datacenter_id = data.vsphere_datacenter.dc.id
} 

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template_ubuntu_desktop" {
  name          = "ubuntu-desktop-t.sriauronet.local"
  datacenter_id = data.vsphere_datacenter.dc.id
} 

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template_ubuntu_server" {
  name          = "ubuntu-server-t.sriauronet.local"
  datacenter_id = data.vsphere_datacenter.dc.id
} 

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template_centos8s" {
  name          = "centos8-stream-t.sriauronet.local"
  datacenter_id = data.vsphere_datacenter.dc.id
} 



# Set vm parameters
resource "vsphere_virtual_machine" "cos8s1" {
  folder = "AnsibleLab2"
  name             = "cos8s1"
  num_cpus         = 2
  memory           = 4096
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_centos8s.guest_id
  firmware         = data.vsphere_virtual_machine.template_centos8s.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "cos8s1.vmdk"
    size = "64"
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_centos8s.id

    customize {
      linux_options {
        host_name = "cos8s1"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.112"
        ipv4_netmask    = 24
      }
      dns_server_list = ["10.1.1.1"]
      ipv4_gateway = "10.1.1.1"
    }
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

resource "vsphere_virtual_machine" "ucontroller1" {
  folder = "AnsibleLab2"
  name             = "ucontroller1"
  num_cpus         = 2
  memory           = 4096
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_desktop.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_desktop.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "ucontroller1.vmdk"
    size = "64"
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_desktop.id

    customize {
      linux_options {
        host_name = "ucontroller1"
        domain    = "ucontroller1.sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.100"
        ipv4_netmask    = 24
      }
      dns_server_list = ["10.1.1.1", "10.10.1.1"]
      ipv4_gateway = "10.1.1.1"
    }
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