
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

data "vsphere_virtual_machine" "template_ubuntu_server_22_04" {
  name          = var.vm_template_userver_22_04
  datacenter_id = data.vsphere_datacenter.dc.id
} 

data "vsphere_virtual_machine" "template_ubuntu_server_20_04" {
  name          = var.vm_template_userver_20_04
  datacenter_id = data.vsphere_datacenter.dc.id
} 

data "vsphere_virtual_machine" "template_rhel8_5" {
  name          = var.vm_template_rhel8_5
  datacenter_id = data.vsphere_datacenter.dc.id
} 

data "vsphere_virtual_machine" "template_cos_stream_8_5" {
  name          = var.vm_template_cos_stream_8_5
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



resource "vsphere_virtual_machine" "alab-controller1" {
  name             = "alab-controller1"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-controller1.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_22_04.id

    customize {
      linux_options {
        host_name = "alab-controller1"
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
    host = vsphere_virtual_machine.alab-controller1.default_ip_address
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


#UbuntuServer1
resource "vsphere_virtual_machine" "alab-userver1" {
  name             = "alab-userver1"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-userver1.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_22_04.id

    customize {
      linux_options {
        host_name = "alab-userver1"
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
    host = vsphere_virtual_machine.alab-userver1.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install vim"
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


#UbuntuServer2
resource "vsphere_virtual_machine" "alab-userver2" {
  name             = "alab-userver2"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-userver2.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_22_04.id

    customize {
      linux_options {
        host_name = "alab-userver2"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.102"
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
    host = vsphere_virtual_machine.alab-userver2.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install vim"
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


#UbuntuServer3
resource "vsphere_virtual_machine" "alab-userver3" {
  name             = "alab-userver3"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_22_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-userver3.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_22_04.id

    customize {
      linux_options {
        host_name = "alab-userver3"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.103"
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
    host = vsphere_virtual_machine.alab-userver3.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install vim"
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


#UbuntuServer4
resource "vsphere_virtual_machine" "alab-userver4" {
  name             = "alab-userver4"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_20_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_20_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-userver4.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_20_04.id

    customize {
      linux_options {
        host_name = "alab-userver4"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.104"
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
    host = vsphere_virtual_machine.alab-userver4.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install vim"
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



#UbuntuServer5
resource "vsphere_virtual_machine" "alab-userver5" {
  name             = "alab-userver5"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_20_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_20_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-userver5.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_20_04.id

    customize {
      linux_options {
        host_name = "alab-userver5"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.105"
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
    host = vsphere_virtual_machine.alab-userver5.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install vim"
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


#UbuntuServer6
resource "vsphere_virtual_machine" "alab-userver6" {
  name             = "alab-userver6"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_server_20_04.guest_id
  firmware         = data.vsphere_virtual_machine.template_ubuntu_server_20_04.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-userver6.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_server_20_04.id

    customize {
      linux_options {
        host_name = "alab-userver6"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.106"
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
    host = vsphere_virtual_machine.alab-userver6.default_ip_address
  }

  provisioner "remote-exec" {

    inline = [
      "echo ${var.password} | sudo -S apt update && apt -y upgrade",
      "echo ${var.password} | sudo -S apt install vim"
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

#RHEL8.5Server1
resource "vsphere_virtual_machine" "alab-rhel8-1" {
  name             = "alab-rhel8-1"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_rhel8_5.guest_id
  firmware         = data.vsphere_virtual_machine.template_rhel8_5.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-rhel8-1.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_rhel8_5.id

    customize {
      linux_options {
        host_name = "alab-rhel8-1"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.107"
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
    host = vsphere_virtual_machine.alab-rhel8-1.default_ip_address
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


#RHEL8.5Server2
resource "vsphere_virtual_machine" "alab-rhel8-2" {
  name             = "alab-rhel8-2"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_rhel8_5.guest_id
  firmware         = data.vsphere_virtual_machine.template_rhel8_5.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-rhel8-2.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_rhel8_5.id

    customize {
      linux_options {
        host_name = "alab-rhel8-2"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.108"
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
    host = vsphere_virtual_machine.alab-rhel8-2.default_ip_address
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

#RHEL8.5Server3
resource "vsphere_virtual_machine" "alab-rhel8-3" {
  name             = "alab-rhel8-3"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_rhel8_5.guest_id
  firmware         = data.vsphere_virtual_machine.template_rhel8_5.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-rhel8-3.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_rhel8_5.id

    customize {
      linux_options {
        host_name = "alab-rhel8-3"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.109"
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
    host = vsphere_virtual_machine.alab-rhel8-3.default_ip_address
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

#CentOS-Stream.5Server1
resource "vsphere_virtual_machine" "alab-cos8-1" {
  name             = "alab-cos8-1"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_cos_stream_8_5.guest_id
  firmware         = data.vsphere_virtual_machine.template_cos_stream_8_5.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-cos8-1.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_cos_stream_8_5.id

    customize {
      linux_options {
        host_name = "alab-cos8-1"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.110"
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
    host = vsphere_virtual_machine.alab-cos8-1.default_ip_address
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


#CentOS-Stream.5Server2
resource "vsphere_virtual_machine" "alab-cos8-2" {
  name             = "alab-cos8-2"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_cos_stream_8_5.guest_id
  firmware         = data.vsphere_virtual_machine.template_cos_stream_8_5.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-cos8-2.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_cos_stream_8_5.id

    customize {
      linux_options {
        host_name = "alab-cos8-2"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.112"
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
    host = vsphere_virtual_machine.alab-cos8-2.default_ip_address
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

#CentOS-Stream.5Server3
resource "vsphere_virtual_machine" "alab-cos8-3" {
  name             = "alab-cos8-3"
  num_cpus         = 2
  memory           = 4096
  folder           = resource.vsphere_folder.Lab1-Basics.path
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template_cos_stream_8_5.guest_id
  firmware         = data.vsphere_virtual_machine.template_cos_stream_8_5.firmware

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # Use a predefined vmware template as main disk
  disk {
    label = "alab-cos8-3.vmdk"
    size = "32"
    thin_provisioned = true
  }
  

  clone {
    template_uuid = data.vsphere_virtual_machine.template_cos_stream_8_5.id

    customize {
      linux_options {
        host_name = "alab-cos8-3"
        domain    = "sriauronet.local"
      }

      network_interface {
        ipv4_address    = "10.1.1.113"
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
    host = vsphere_virtual_machine.alab-cos8-3.default_ip_address
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
