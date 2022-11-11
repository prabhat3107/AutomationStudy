
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


parent_project_folder_name="KubernetesLabs"
project_folder_name="MultiNode-Lab1"

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
        vm_name = "kube-control1"
        vm_host_name = "kube-control1"
        vm_num_cpus = 4
        vm_memory = 8192
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.121"
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
        vm_name = "kube-control2"
        vm_host_name = "kube-control2"
        vm_num_cpus = 4
        vm_memory = 8192
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.122"
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
        vm_name = "kube-wn1"
        vm_host_name = "kube-wn1"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.131"
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
        vm_name = "kube-wn2"
        vm_host_name = "kube-wn2"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.132"
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
        vm_name = "kube-wn3"
        vm_host_name = "kube-wn3"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.133"
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
 
    },
    {
        vm_name = "kube-wn4"
        vm_host_name = "kube-wn4"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.134"
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
        vm_name = "kube-wn5"
        vm_host_name = "kube-wn5"
        vm_num_cpus = 2
        vm_memory = 4096
        vm_nic_config = [
                {
                    ipv4_address = "10.1.1.135"
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
 
    }
  ]


network_node_vm_list = [

  ]

provisioning_commands = [
      "sudo apt update -y",
      "sudo apt upgrade -y"
    ]