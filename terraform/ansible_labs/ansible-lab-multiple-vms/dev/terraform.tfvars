
dc_name = "SriAuronetHDC1"

vcenter_host_name = "vcenter1.sriauronet.local"

vcenter_user_name = "administrator@sriauronet.local"

vcneter_user_password = "Beauty!123"

resource_pool_name = "esxi-1.sriauronet.local/Resources"

vsphere_datastore_name =  "datastore2"


vm_network_name_1 = "VMNet-G1"
vm_network_name_2 = "VMNet-G2"
vm_network_name_3 = "VMNet-G3"
vm_network_name_4 = "ExternetlNet"
vm_userver_template_name = "centos-stream-8.5-template"
vm_cos8_template_name = "centos-stream-8.5-template"

parent_project_folder_name="AnslbleLabs"
project_folder_name="MultiNode-Lab1"

vm_user_name = "prabhat"
vm_user_password = "Beauty!123"

vm_domain_name = "sriauronet.local"

vm_ipv4_netmask = 24
dns_server_list = ["10.1.1.1"]
dns_suffix_list = ["sriauronet.local"]
vm_ipv4_gateway = "10.1.1.1"


vm_ipv4_gateway_2 = "10.10.1.1"

userver_vm_list = [
    {
        vm_name = "alab-userver1"
        vm_host_name = "alab-userver1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.181"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.181"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.181"
                    ipv4_netmask = 24
                },
            ]

    },

    {
        vm_name = "alab-userver2"
        vm_host_name = "alab-userver2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.182"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.182"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.182"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "alab-userver3"
        vm_host_name = "alab-userver3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.183"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.183"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.183"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "alab-userver4"
        vm_host_name = "alab-userver4"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.184"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.184"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.184"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "alab-userver5"
        vm_host_name = "alab-userver5"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.185"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.185"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.185"
                    ipv4_netmask = 24
                },
            ]
 
    }
  ]

cos8_vm_list = [
    {
        vm_name = "alab-cos8-server1"
        vm_host_name = "alab-cos8-server1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.191"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.191"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.191"
                    ipv4_netmask = 24
                },
            ]

    },

    {
        vm_name = "alab-cos8-server2"
        vm_host_name = "alab-cos8-server2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.192"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.192"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.192"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "alab-cos8-server3"
        vm_host_name = "alab-cos8-server3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.193"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.193"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.193"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "alab-cos8-server4"
        vm_host_name = "alab-cos8-server4"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.194"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.194"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.194"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "alab-cos8-server5"
        vm_host_name = "alab-cos8-server5"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.195"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.195"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.195"
                    ipv4_netmask = 24
                },
            ]
 
    }
  ]


provisioning_commands = [
      "sudo dnf update -y",
      "sudo dnf install -y python3",
      "sudo apt update -y",
      "sudo apt -y upgrade",
      "sudo apt -y install python3"
    ]