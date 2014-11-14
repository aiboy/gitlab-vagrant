#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install wget --force-yes --yes
wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb
sudo apt-get install openssh-server --force-yes --yes
sudo DEBIAN_FRONTEND=noninteractive apt-get install postfix --force-yes --yes
sudo apt-get install curl --force-yes --yes
sudo apt-get install vim --force-yes --yes
sudo dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb

echo "external_url 'http://192.168.66.10'" | sudo tee /etc/gitlab/gitlab.rb > /dev/null

sudo gitlab-ctl reconfigure
printf "yes" | sudo gitlab-rake gitlab:setup RAILS_ENV=production

rm -rf gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb