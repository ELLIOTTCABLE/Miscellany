# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-14.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "123.123.123.123"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  #config.vm.network "public_network", ip: "192.168.33.10", bridge: [
  #  "en0: Wi-Fi (AirPort)"
  #]

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "1024"
    v.vmx["numvcpus"] = "4"
   #v.gui = true
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Fix for “stdin: is not a tty”
  # /via https://github.com/mitchellh/vagrant/issues/1673#issuecomment-168205206
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive

    apt-get -q -y update

    apt-get -q -y install man-db manpages manpages-dev manpages-posix manpages-posix-dev texinfo glibc-doc

    apt-get -q -y install git zsh rake tmux
  SHELL

  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive

    apt-get -q -y install software-properties-common

    add-apt-repository -y ppa:ubuntu-toolchain-r/test
    apt-get -q -y update

    #update-alternatives --remove-all gcc
    apt-get -q -y install gcc-4.9

    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 10
    update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30                                2>&1
    update-alternatives --set cc /usr/bin/gcc

    update-alternatives --config gcc
  SHELL

  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    apt-get -q -y install qemu-system-x86
    apt-get -q -y install gdb
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    ssh-keyscan -H github.com >>~/.ssh/known_hosts 2>&1
    git clone -q https://github.com/ELLIOTTCABLE/System.git ~/.system

    (cd ~/.system && rake)
    cat ~/.ssh~/authorized_keys >> ~/.ssh/authorized_keys

    echo "export SYSTEM='Ubuntu 12.04.1 Precise LTS'" >> ~/.profile.local
    echo "export COLOURIZE_AS='white'" >> ~/.profile.local
    echo "export SYSTEM_REPO=\"$HOME/.system\"" >> ~/.profile.local

    echo "set auto-load safe-path /" > ~/.gdbinit
  SHELL

  config.vm.provision "shell", privileged: true, inline: "chsh -s /bin/zsh vagrant"
  config.vm.provision "shell", privileged: false, inline: "zsh -ic 'zgen update'"
end
