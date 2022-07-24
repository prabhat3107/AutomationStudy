
dc_name = "SriAuronetHDC1"

vcenter_host_name = "vcenter1.sriauronet.local"

vcenter_user_name = "administrator@sriauronet.local"

vcneter_user_password = "Beauty!123"

resource_pool_name = "esxi-1.sriauronet.local/Resources"

vsphere_datastore_name =  "datastore2"


vm_network_name_1 = "VMNet-G1"
vm_network_name_2 = "VMNet-G2"
vm_network_name_3 = "VMNet-G3"

vm_template_name = "centos-stream-8.5-template"


parent_project_folder_name="OpenStackLabs"
project_folder_name="MultiNode-Lab1"

#vm_user_name = "prabhat"
#vm_user_password = "Beauty!123"

vm_domain_name = "sriauronet.local"

vm_ipv4_netmask = 24
dns_server_list = ["10.1.1.1"]
dns_suffix_list = ["sriauronet.local"]
vm_ipv4_gateway = "10.1.1.1"


vm_list = [
    {
        vm_name = "ostack-control"
        vm_host_name = "ostack-control"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.200"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.200"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.200"
                    ipv4_netmask = 24
                },
            ]

    },

    {
        vm_name = "ostack-compute1"
        vm_host_name = "ostack-compute1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.201"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.201"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.201"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "ostack-compute2"
        vm_host_name = "ostack-compute2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.202"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.202"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.202"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "ostack-compute3"
        vm_host_name = "ostack-compute3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.203"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.203"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.203"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "ostack-network"
        vm_host_name = "ostack-network"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.222"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.2.222"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.222"
                    ipv4_netmask = 24
                },
            ]
 
    }
  ]
