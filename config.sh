clear
echo "/ changing root password"
echo "root:R0sebr1dge" | chpasswd
sleep 2
clear
echo "+ applying custom configs for remote logins"
touch /etc/skel/.hushlogin
rm -rf /etc/motd
rm -rf /etc/issue
rm -rf /etc/issue.net
rm -rf /root/.ssh/known_hosts
rm -rf /root/.ssh/authorized_keys
sleep 2
clear
echo "- removing old sshd_config"
cd /etc/ssh/ && rm sshd_config
echo "+ adding custom sshd_config"
wget https://www.dropbox.com/s/05f96jvwddl09qo/sshd_config
sleep 2
clear
echo "+ adding standard user"
adduser --disabled-password -shell /bin/bash --home /home/joshua --gecos "Joshua Wareing" joshua
echo "+ user added successfully "
sleep 2
clear
echo "joshua:wareing" | chpasswd
echo "+ adding standard user to sudo group"
adduser joshua sudo
echo "+ user added to 'sudo' group successfully"
sleep 2
clear
echo "+ adding standard user to sudo group"
adduser joshua sudo
echo "+ adding monitoring user"
adduser --disabled-password -shell /bin/htop --home /home/monitor --gecos "System Monitor" monitor
echo "[complete]"
echo "+ adding user to sudo group"
adduser monitor sudo
echo "+ user added to 'sudo' group successfully"
echo "+ updating APT"
apt-get -y update
echo "+ removing old packages"
apt-get -y autoremove
sleep 2
clear
echo "******** downloading authorized_keys & known_hosts files from Dropbox ********"
cd /root/.ssh/
wget https://www.dropbox.com/s/5w98yy25ix1aew0/authorized_keys
wget https://www.dropbox.com/s/qol09j0nxgra8xx/known_hosts
wget https://raw.githubusercontent.com/JoshWareing/linux-setup-scripts/master/monitor_ssh_key.sh && chmod +x monitor_ssh_key.sh && ./monitor_ssh_key.sh
sleep 3
clear
echo "******** restarting SSH Server (your connection may terminate(this CANNOT be helped.)) ********"
service ssh restart
sleep 3
clear
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
clear
echo "******** Running Installer ( shellinabox ) ********"
apt-get -y install shellinabox
service shellinabox stop
cd /etc/default/
rm -rf shellinabox
wget https://raw.githubusercontent.com/JoshWareing/linux-setup-scripts/master/shellinabox
service shellinabox start
echo "******** Installer Completed ( shellinabox ) ********"
sleep 3
clear

echo "finished."

