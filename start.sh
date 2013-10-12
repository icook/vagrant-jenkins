#!/bin/bash
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

apt-get -y update
apt-get -y install python-software-properties curl
# Add all our ppas, etc
add-apt-repository ppa:chris-lea/node.js
# docker
sh -c "curl https://get.docker.io/gpg | apt-key add -"
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
 
echo "Acquire::http { Proxy \"http://192.168.1.118:3142\"; };" > /etc/apt/apt.conf.d/02local_proxy
apt-get -y update
apt-get -y install python-pip python-dev virtualenvwrapper git vim nodejs nginx zsh aptitude curl rubygems ruby ruby-dev lxc-docker jenkins uwsgi
rm /etc/nginx/sites-enabled/default
 
# setup guard
gem install guard guard-livereload guard-coffeescript guard-less guard-compass guard-shell

# recess css compiler
npm install -g recess

# Install my custom oh-my-zsh
wget --no-check-certificate https://github.com/icook/oh-my-zsh/raw/master/tools/install.sh -O - | sh
 
# Install custom vimrc
wget --no-check-certificate https://raw.github.com/icook/vimrc/master/auto_install.sh -O - | sh

# setup git defaults
git config --global core.editor vim
git config --global color.ui true
git config --global user.name "Jenkins"
git config --global user.email jenkins@jenkins.ibcook.pri

cp /srv/config/nginx.conf /etc/nginx/nginx.conf
