#!/bin/bash
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
do-release-upgrade
rm -rf /tmp/*
apt-get -y install apache2 php5 php5 mysql-server mysql-client phpmyadmin shellinabox htop nload nmap
apt-get -y autoclean
apt-get -y autoremove
