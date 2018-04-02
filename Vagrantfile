# -*- mode: ruby -*-
# vi: set ft=ruby :

# Memorable name for your
VM_NAME = 'ubuntu-dev'
# VM User — 'vagrant' by default
VM_USER = 'vagrant'
# Username on your Mac
MAC_USER = 'itspare'

# Host folder to sync
HOST_PATH = '/Users/' + MAC_USER + '/go'
# Where to sync to on Guest — 'vagrant' is the default user name
GUEST_PATH = '/home/' + VM_USER + '/' + VM_NAME

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = VM_NAME
  config.ssh.forward_agent = true
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder HOST_PATH, GUEST_PATH
  config.vm.synced_folder '.', '/home/'+VM_USER+'', disabled: true

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.name = VM_NAME

     # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end

  config.vm.provision :shell, :path => File.join( "scripts", "base.sh" )
  config.vm.provision :shell, :path => File.join( "scripts", "ssh.sh" )
  config.vm.provision :shell, :path => File.join( "scripts", "python.sh" )
  config.vm.provision :shell, :path => File.join( "scripts", "go.sh" )
end
