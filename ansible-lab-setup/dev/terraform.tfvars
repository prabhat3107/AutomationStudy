
dc_name = "SriAuronetHDC1"

vcenter_host_name = "vcenter1.sriauronet.lan"

vcenter_user_name = "administrator@sriauronet.local"

vcneter_user_password = "Beauty!123"

resource_pool_name = "10.10.1.11/Resources"

vsphere_datastore_name =  "datastore2"


vm_network_name_1 = "ExternetlNet"
vm_network_name_2 = "VMNet-G1"
vm_network_name_3 = "VMNet-G2"
vm_network_name_4 = "VMNet-G3"
vm_template_name = "userver-22.04-lts-template"
vm_userver22_template_name = "userver-22.04-lts-template"
vm_userver20_template_name = "userver20.04-lts-template"
vm_centos9_template_name = "centos9-stream-template"

parent_project_folder_name="AnsibleLabsFolder"
project_folder_name="MultiNode-Lab1"

vm_user_name = "prabhat"
vm_user_password = "Beauty!123"

vm_domain_name = "sriauronet.lan"

vm_ipv4_netmask = 24
dns_server_list = ["10.10.1.1"]
dns_suffix_list = ["sriauronet.lan"]
vm_ipv4_gateway = "10.10.1.1"


vm_ipv4_gateway_2 = "10.10.1.1"

vm_userver22_list = [
    {
        vm_name = "ansbl-controller1"
        vm_host_name = "ansbl-controller1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.121"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.121"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.121"
                    ipv4_netmask = 24
                },
            ]

    },
        {
        vm_name = "ansbl-controller2"
        vm_host_name = "ansbl-controller2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.122"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.122"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.122"
                    ipv4_netmask = 24
                },
            ]

    },

    {
        vm_name = "userver22-04-1"
        vm_host_name = "userver22-04-1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.131"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.131"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.131"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "userver22-04-2"
        vm_host_name = "userver22-04-2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.132"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.132"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.132"
                    ipv4_netmask = 24
                },
            ]
 
    },
    {
        vm_name = "userver22-04-3"
        vm_host_name = "userver22-04-3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.133"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.133"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.133"
                    ipv4_netmask = 24
                },
            ]
 
    }
  ]

vm_userver20_list = [
    {
        vm_name = "userver20-04-1"
        vm_host_name = "userver20-04-1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.134"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.134"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.134"
                    ipv4_netmask = 24
                },
            ]

    },
    {
        vm_name = "userver20-04-2"
        vm_host_name = "userver20-04-2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.135"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.135"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.135"
                    ipv4_netmask = 24
                },
            ]

    },
    {
        vm_name = "userver20-04-3"
        vm_host_name = "userver20-04-3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.136"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.136"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.136"
                    ipv4_netmask = 24
                },
            ]

    }    
]

vm_centos9_list = [
    {
        vm_name = "centos9-1"
        vm_host_name = "centos9-1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.137"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.137"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.137"
                    ipv4_netmask = 24
                },
            ]

    },
    {
        vm_name = "centos9-2"
        vm_host_name = "centos9-2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.138"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.138"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.138"
                    ipv4_netmask = 24
                },
            ]

    },
    {
        vm_name = "centos9-3"
        vm_host_name = "centos9-3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.10.1.139"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "172.16.0.139"
                    ipv4_netmask = 24
                },
                {
                    ipv4_address = "10.1.3.139"
                    ipv4_netmask = 24
                },
            ]

    }    
]



provisioning_commands = [
      "sudo apt update -y",
      "sudo apt upgrade -y"
    ]