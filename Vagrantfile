# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.hostname = "synology-build-vm"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']

    chef.add_recipe('apt::cacher-client')
    chef.add_recipe('apt')

    # This is where all the magic happens.
    # see site-cookbooks/synology-build/
    chef.add_recipe('synology-build')

    chef.json = {
      'apt' => {
        # uncomment if there is an apt-cache in the local network
        # 'cacher_ipaddress' => '192.168.0.1'
      }
    }
  end
end
