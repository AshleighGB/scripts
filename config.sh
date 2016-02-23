#change root password
passwd root
# update repos....
apt-get -y update
# install figlet to enable ASCII art
sudo apt-get install figlet
# create directory
mkdir /etc/update-motd.d/
# change to new directory
cd /etc/update-motd.d/
# remove MOTD file
rm /etc/motd
# symlink dynamic MOTD file
ln -s /var/run/motd /etc/motd
# get the 00-header, 10-sysinfo and 90-footer files...
cd /etc/update-motd.d/
wget https://raw.githubusercontent.com/JoshWareing/linux-setup-scripts/master/00-header
wget https://raw.githubusercontent.com/JoshWareing/linux-setup-scripts/master/10-sysinfo
wget https://raw.githubusercontent.com/JoshWareing/linux-setup-scripts/master/90-footer
# make files executable
chmod +x /etc/update-motd.d/*
clear
echo "******** this script is done. you must now logout and back in again to see the changes. ********"

wget https://raw.githubusercontent.com/JoshWareing/linux-setup-scripts/master/99-runonce && chmod +x 99-runonce && ./99-runonce



