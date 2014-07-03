
# Intro 

Packer attempts to package Riak.

# Prerequisites

VirtualBox ( https://www.virtualbox.org/wiki/Downloads  )
Packer ( `brew install packer` )
Caching proxy running on port 8123 on all interfaces

# Bugs...

The preseed configuration file is located in `ubuntu_64_ldap_server/preseeds/preseed.cfg` but the only way I could get packer to find it, was to specify the absolute path to it in `ubuntu_64_ldap_server/ubuntu_sample.json` - as it currently stands - `/common/packer_poc/ubuntu_64_ldap_server/preseeds/preseed.cfg`


That *really needs* to be a relative path... 


# Usefull commands

Commands I've been using while working with this.

    packer build ubuntu_64_ldap_server/ubuntu_sample.json
    VboxManage list vms
    VboxManage unregistervm packer-virtualbox-iso --delete
    VboxManage import ./output-virtualbox-iso/packer-virtualbox-iso.ovf
    VBoxManage start packer-virtualbox-iso
    VBoxManage startvm packer-virtualbox-iso

# Development life cycle

Just itterating over VM creation

```
VBoxManage controlvm packer-virtualbox-iso poweroff ; VboxManage unregistervm packer-virtualbox-iso --delete ; rm -rf output-virtualbox-iso ; packer build ubuntu_64_ldap_server/ubuntu_sample.json
```

Just importing and running a box 

```
VboxManage list vms ; VboxManage import ./output-virtualbox-iso/packer-virtualbox-iso.ovf ; VBoxManage start packer-virtualbox-iso ; VBoxManage startvm packer-virtualbox-iso
```

The full cycle

```
VBoxManage controlvm packer-virtualbox-iso poweroff ; VboxManage unregistervm packer-virtualbox-iso --delete ; rm -rf output-virtualbox-iso ; packer build ubuntu_64_ldap_server/ubuntu_sample.json ; VboxManage import ./output-virtualbox-iso/packer-virtualbox-iso.ovf ; VBoxManage startvm packer-virtualbox-iso
```
