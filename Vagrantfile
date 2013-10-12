# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "precise64"
    config.vm.hostname = "jenkins"
    config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :public_network

    config.ssh.forward_agent = true

    config.vm.provision :shell, :path => "start.sh"
    config.vm.synced_folder "config", "/srv/config"
end
