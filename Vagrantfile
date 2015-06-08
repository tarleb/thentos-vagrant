# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Use a box which has salt preinstalled.  Changing the box might require
  # some minor changes to the `salt/boostrap.sh` script.
  config.vm.box = "debian-8.0.0-amd64.box"
  config.vm.box_url = "http://static.zeitkraut.de/debian-8.0.0-amd64.box"
  config.vm.box_download_checksum_type = "sha256"
  config.vm.box_download_checksum =
    "1853bfafc0c880cd25ba6dcfaed050d30828fba2d783098efb7778cd3ed97ef6"

  # The ports are redirected on the guest system by rinetd, thereby matching
  # guest ports and host ports.
  config.vm.network :forwarded_port, guest: 17001, host: 7001
  config.vm.network :forwarded_port, guest: 17002, host: 7002

  config.vm.provider :virtualbox do |vb|
    # GHC requires a bit more memory than the VM has by default.
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    # Most dev-machines have multicores nowadays.  This speed up compilation
    # quite a bit. Adjust to your liking.
    vb.cpus = 2
  end

  ## SYNCED FOLDERS
  # Basics
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "salt/roots/", "/srv/salt/", type: 'rsync'

  # Thentos
  config.vm.synced_folder "thentos/", "/home/vagrant/thentos/", type: "rsync"


  ## PROVISIONING
  config.vm.provision :salt do |salt|

    # The vagrant default is to run the salt bootstrap script every time the
    # machine is booted.  Not nice and possibly insecure.  Run a stripped
    # down, simplified bootstrap script instead (works only with Debian).
    # Remove this line if you want the default bootstrap-salt.sh script to be
    # downloaded instead.
    salt.bootstrap_script = "salt/bootstrap.sh"

    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end
end
