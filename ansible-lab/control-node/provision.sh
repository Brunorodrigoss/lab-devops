#!/usr/bin/env bash

sudo yum -y install epel-release
echo "Installing ansible"
sudo yum -y install ansible
cat <<EOT >> /etc/hosts
192.168.2.2 control-node
192.168.2.3 app01
192.168.2.4 db01
EOT

sudo -u vagrant ssh-keygen -t rsa -N '' <<<''

if [ -e public_key.txt ];
then
    rm public_key.txt
fi

cat /home/vagrant/.ssh/id_rsa.pub > /vagrant/public_key.txt