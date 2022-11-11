
dc_name = "SriAuronetHDC1"

vcenter_host_name = "vcenter1.sriauronet.local"

vcenter_user_name = "administrator@sriauronet.local"

vcneter_user_password = "Beauty!123"

resource_pool = "esxi-1.sriauronet.local/Resources"

vsphere_datastore_name =  "datastore2"

vm_network_name = "VMNet-G1"

vm_template_name = "userver-22.04-lts-template"

vm_name = "alab-controller1"

vsphere_project_folder_name="BASIC"
vsphere_parent_folder_name="ANSIBLELAB_V2"

vm_user_name = "prabhat"
vm_user_password = "Beauty!123"


vm_ipv4_netmask = 24
dns_server_list = ["10.1.1.1"]
dns_suffix_list = ["sriauronet.local"]
vm_ipv4_gateway = "10.1.1.1"
vm_domain    = "sriauronet.local"

vm_list = [
    {
        vm_name = "alab-controller1"
        vm_host_name = "alab-controller1"
        vm_ipv4_address = "10.1.1.240"
        vm_template_name = "userver-22.04-lts-template"

    },

    {
        vm_name = "alab-pb1"
        vm_host_name = "alab-userver1"
        vm_ipv4_address = "10.1.1.241"
        vm_template_name = "userver-22.04-lts-template"

    },
    {
        vm_name = "alab-pb2"
        vm_host_name = "alab-userver2"
        vm_ipv4_address = "10.1.1.242"
        vm_template_name = "userver-22.04-lts-template"

    },
    {
        vm_name = "alab-pb3"
        vm_host_name = "alab-userver3"
        vm_ipv4_address = "10.1.1.243"
        vm_template_name = "userver-22.04-lts-template"

    },

    {
        vm_name = "alab-pb4"
        vm_host_name = "alab-userver4"
        vm_ipv4_address = "10.1.1.244"
        vm_template_name = "userver-22.04-lts-template"

    }



  ]
