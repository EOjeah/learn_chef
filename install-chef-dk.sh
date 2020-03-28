#!/bin/bash
yum update -y

# create staging directories
if [ ! -d /downloads ]; then
  mkdir /downloads
fi

# download the Chef server package
if [ ! -f /downloads/chef-workstation-0.17.5-1.el7.x86_64.rpm ]; then
  echo "Downloading the Chef workstation package..."
  curl -o /downloads/chef-workstation-0.17.5-1.el7.x86_64.rpm https://packages.chef.io/files/stable/chef-workstation/0.17.5/el/7/chef-workstation-0.17.5-1.el7.x86_64.rpm
fi

# install Chef server
if [ ! $(chef -v) ]; then
  echo "Installing Chef Worstation..."
  rpm -Uvh /downloads/chef-workstation-0.17.5-1.el7.x86_64.rpm
fi

echo "Your Chef worstation is ready!"