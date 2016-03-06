clear
echo "******** changing root password ********"
echo "root:R0sebr1dge" | chpasswd
sleep 2
clear
echo "******** making the login prompt cleaner ********"
touch /etc/skel/.hushlogin
rm -rf /etc/motd
rm -rf /etc/issue
rm -rf /etc/issue.net
rm -rf /root/.ssh/known_hosts
rm -rf /root/.ssh/authorized_keys
sleep 2
clear
echo "******** adding custom sshd_config ********"
cd /etc/ssh/ && rm sshd_config && wget https://www.dropbox.com/s/05f96jvwddl09qo/sshd_config
sleep 2
clear
echo "******** adding standard user ********"
adduser --quiet --disabled-password -shell /bin/bash --home /home/joshua --gecos "Joshua Wareing" joshua
echo "******** user added successfully ********"
sleep 2
clear
echo "joshua:wareing" | chpasswd
echo "******** adding standard user to sudo group ********"
adduser joshua sudo --quiet
echo "******** user added to 'sudo' group successfully ********"
sleep 2
clear
echo "******** updating APT repositories & removing any old packages ********"
apt-get -y update && apt-get -y autoremove
sleep 2
clear
echo "******** downloading authorized_keys & known_hosts files from Dropbox ********"
cd /root/.ssh/ && wget https://www.dropbox.com/s/5w98yy25ix1aew0/authorized_keys && wget https://www.dropbox.com/s/qol09j0nxgra8xx/known_hosts
sleep 3
clear
echo "******** restarting SSH Server (your connection may terminate(this CANNOT be helped.)) ********"
service ssh restart
sleep 3
echo "******** SSH Server Restarted ********"
sleep 1
clear
echo "******** ssh security has been successfully configured.  ********"
sleep 3
clear
echo "******** Running Installer ( htop ) ********"
apt-get -y install htop
echo "******** Installer Completed ( htop ) ********"
sleep 3
echo "******** Running Installer ( shellinabox ) ********"
apt-get -y install shellinabox
echo "******** Installer Completed ( shellinabox ) ********"
sleep 3
clear
