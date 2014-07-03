
# Intro 

Packer attempts to package Riak.

# Prerequisites

VirtualBox ( https://www.virtualbox.org/wiki/Downloads  )
Packer ( `brew install packer` )

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
VboxManage unregistervm packer-virtualbox-iso --delete ; rm -rf output-virtualbox-iso ; packer build ubuntu_64_ldap_server/ubuntu_sample.json
```

Just importing and running a box 

```
VboxManage list vms ; VboxManage import ./output-virtualbox-iso/packer-virtualbox-iso.ovf ; VBoxManage start packer-virtualbox-iso ; VBoxManage startvm packer-virtualbox-iso
```

The full cycle

```
VBoxManage controlvm poweroff packer-virtualbox-iso; VboxManage unregistervm packer-virtualbox-iso --delete ; rm -rf output-virtualbox-iso ; packer build ubuntu_64_ldap_server/ubuntu_sample.json ; VboxManage import ./output-virtualbox-iso/packer-virtualbox-iso.ovf ; VBoxManage start packer-virtualbox-iso ; VBoxManage startvm packer-virtualbox-iso
```
