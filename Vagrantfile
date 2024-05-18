# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'almalinux/9'
  config.vm.provider 'libvirt' do |vb|
    vb.memory = 768
    vb.cpus = 1
  end

  2.times do |index|
    config.vm.define "server#{index}" do |server|
      host = 250 + index
      server.vm.network "private_network", ip: "172.17.64.#{host.to_s}"
    end
  end
end
