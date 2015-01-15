# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :ufovm do |ufo_config|

    # UNCOMMENT THE LINES BELOW TO START WITH A FRESH BOX
    # A clean ubuntu 14.04 32-bit box, and the
    # url to download from if necessary
    ufo_config.vm.box = "trusty32"
    ufo_config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"

    # Use salt to provision the vm
    ufo_config.vm.synced_folder "vm/salt/", "/srv/salt"
    ufo_config.vm.synced_folder "vm/salt/pillar/", "/srv/pillar"
    ufo_config.vm.provision :salt do |salt|
      salt.minion_config = "vm/salt/minion"
      salt.run_highstate = true
      salt.verbose = true
      salt.install_type = "stable"
    end


    # forward the Django dev server to host
    ufo_config.vm.network "forwarded_port", guest: 8000, host: 8000


    # also place our code in the home folder of the server
    # This is required for our salt configs to work properly
    ufo_config.vm.synced_folder ".", "/home/vagrant/ufo"


    # We can afford to beef up the VM a bit
    ufo_config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    end


  end

end


