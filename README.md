# install

```sh
# as root
## kvm
dnf -y install qemu-kvm libvirt virt-install
systemctl enable --now libvirtd 

## vagrant
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install vagrant

dnf -y install libvirt-devel
usermod -aG libvirt user

su - user
```

```sh
# as user
vagrant plugin install vagrant-libvirt

cat <<'VEOF' > Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'almalinux/9'
  config.vm.provider 'libvirt' do |vb|
    vb.memory = 768
    vb.cpus = 1
  end
end
VEOF

vagrant up
```
