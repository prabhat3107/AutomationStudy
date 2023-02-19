
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
vm_template_name = "userver-22.04-lts-template"


parent_project_folder_name="NginxLB"
project_folder_name="Lab1"

vm_user_name = "prabhat"
vm_user_password = "Beauty!123"

vm_domain_name = "sriauronet.local"

vm_ipv4_netmask = 24
dns_server_list = ["10.1.1.1"]
dns_suffix_list = ["sriauronet.local"]
vm_ipv4_gateway = "10.1.1.1"


vm_ipv4_gateway_2 = "10.10.1.1"

vm_list = [
    {
        vm_name = "nginx-lb"
        vm_host_name = "nginx-lb"
        vm_num_cpus = 2
        vm_memory = 2048
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.30"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.30"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.30"
                    ipv4_netmask = 24
                },
            ]

    },

    {
        vm_name = "server-node1"
        vm_host_name = "server-node1"
        vm_num_cpus = 2
        vm_memory = 2048
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.31"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.31"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.31"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "server-node2"
        vm_host_name = "server-node2"
        vm_num_cpus = 2
        vm_memory = 2048
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.32"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.32"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.32"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "server-node3"
        vm_host_name = "server-node3"
        vm_num_cpus = 2
        vm_memory = 2048
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.33"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.33"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.33"
                    ipv4_netmask = 24
                },
            ]
 
    }

  ]



network_node_vm_list = [

  ]

provisioning_commands = [
      "sudo apt update -y",
      "sudo apt upgrade -y"
    ]