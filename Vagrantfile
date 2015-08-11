# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!

$scipt = <<SCRIPT
echo "Updating synaptic"
apt-get update
echo "Done update synaptic"
debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysql'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysql'
apt-get install -y mysql-server
ufw allow 22
ufw allow 3306
ufw allow 13306
sed -i 's/127.0.0.1/10.0.2.15/' /etc/mysql/my.cnf
mysql -u root --password=mysql < /vagrant/initialize.sql
service mysql restart
apt-get install -y vim curl git
echo "Done provisioning"
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.ssh.forward_agent = true

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-14.10"

  config.vm.provider "virtualbox" do |v|
    v.name = "MySQL Server"
  end

  config.vm.network :forwarded_port, guest: 3306, host: 3306

  config.vm.network "private_network", ip: "192.168.50.80"

  config.vm.provision "shell", inline: $scipt

end
