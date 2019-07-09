#!/bin/sh

##########################################################################################################################

# Copyright 2011 Yogesh Panchal (yspanchal@gmail.com)
# Author: Yogesh Panchal (yspanchal@gmail.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# File : Nagios-Auto.sh : A simple shell script to Install Nagios Monitoring Tool.

##########################################################################################################################


# Text color variables

txtund=$(tput sgr 0 1)    # Underline
txtbld=$(tput bold)       # Bold
txtred=$(tput setaf 1)    # Red
txtgrn=$(tput setaf 2)    # Green
txtylw=$(tput setaf 3)    # Yellow
txtgrn=$(tput setaf 4)    # Blue
txtpur=$(tput setaf 5)    # Purple
txtcyn=$(tput setaf 6)    # Cyan
txtwht=$(tput setaf 7)    # White
txtrst=$(tput sgr0)       # Text reset


#########################################################################################################################

echo "#############################################################"
echo "#############################################################"
echo "##                                                         ##"
echo "##       Welcome to Nagios Auto Installation Script        ##"
echo "##               Written By Yogesh Panchal                 ##"
echo "##           ${txtred}  yogesh.pachal@fafadiatech.com${txtrst}		   ##"              
echo "#############################################################"
echo "#############################################################"
echo ""
echo ""
#############################################################################################################################

############ Variable Definition ################

a="nagios-3.2.3.tar.gz"
b="nagios-3.3.1.tar.gz"
c="nagios-3.2.3"
d="nagios"
e="nagios-plugins-1.4.15.tar.gz"
log=/tmp/nagios_setup.log

#############################################################################################################################

#############################################################################################################################

############ Functions Definition ################

stop() {
echo ""
echo "${txtred}****** Nagios Installation Aborted *******${txtrst}"
echo ""
echo "${txtred}Error${txtrst}"
echo "****** Nagios Installation Aborted *******" >> $log
echo "" >> $log
echo "Error" $log
exit 0
}

final() {
echo ""
echo ""
echo "${txtred}Nagios Installation Completed successfully...!${txtrst}"  
echo "Nagios Installation Completed successfully...!" >> $log
echo ""
echo "${txtred}Following are the details...!${txtrst}"
echo "Following are the details...!" >> $log  
echo ""
echo "Press Enter to Continue"
read line
echo ""
echo ""
echo "${txtred}Nagios Installation Directory ' /usr/local/nagios/ '${txtrst}"  
echo "Nagios Installation Directory ' /usr/local/nagios/ '" >> $log
echo ""
echo "${txtred}Nagios Main Configuration File ' /usr/local/nagios/etc/nagios.cfg '${txtrst}"
echo "Nagios Main Configuration File ' /usr/local/nagios/etc/nagios.cfg '" >> $log  
echo ""
echo "${txtred}Nagios Object configuration Files ' /usr/local/nagios/etc/objects/ '${txtrst}"  
echo "Nagios Object configuration Files ' /usr/local/nagios/etc/objects/ '" >> $log
echo ""
echo "${txtred}Nagios Apache Configuration File ' /etc/httpd/conf.d/nagios.conf '${txtrst}"
echo "Nagios Apache Configuration File ' /etc/httpd/conf.d/nagios.conf '" >> $log  
echo ""
echo ""
echo "Press Enter"
read line
echo "${txtred}Nagios Web Frontend Url ' http://localhost/nagios ' or ' http://yourhost/nagios '${txtrst}"
echo "Nagios Web Frontend Url ' http://localhost/nagios ' or ' http://yourhost/nagios '" >> $log  
echo ""
echo "Nagios Web Frontend Username :- nagiosadmin${txtrst}"
echo "Nagios Web Frontend Username :- nagiosadmin" >> $log  
echo ""
echo "Nagios Web Frontend Password :- $line6${txtrst}"  
echo "Nagios Web Frontend Password :- $line6" >> $log  
echo ""
echo ""
read line
echo ""
echo "${txtred} ******** Check Nagios installation Log File /tmp/nagios_setup.log ******** ${txtrst}"
echo ""
echo " ${txtred}********** Thank You For Using Nagios Auto Installation Script ********** ${txtrst}"
echo ""
echo " 			${txtred}******** yspanchal@gmail.com ******** ${txtrst}"
echo " 			       ${txtred}****** Thank You ****** ${txtrst}"
echo " ********** Thank You For Using Nagios Auto Installation Script ********** " >> $log
echo "" >> $log
echo " 			******** yspanchal@gmail.com ******** " >> $log
exit 0
}

error() {
echo ""
echo ""
echo "${txtgrn}It Seems Like There is Nagios Sample Configuration File error${txtrst}"  
echo "${txtgrn}to Verify error use '/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg' command${txtrst}" 
echo "It Seems Like There is Nagios Sample Configuration File error" >> $log
echo "to Verify error use '/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg' command " >> $log  
final
echo ""
echo ""
}

servicerestart() {
echo ""
echo ""
echo "${txtgrn}Restarting Nagios Service...!${txtrst}"  
echo ""
echo ""
/etc/init.d/nagios restart  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Restarting Nagios Service Successful...!${txtrst}"  
echo "Nagios Service Restarted" >> $log
final
else
echo "${txtred}Restarting Nagios Service Unsuccessful, Nagios Sample Configuration Files Error${txtrst}" 
echo "Nagios configuration Files Error" >> $log 
error
fi
}

verify() {
echo ""
echo ""
echo "${txtgrn}Verify the sample Nagios configuration files.....!${txtrst}"  
echo ""
echo ""
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Verification of Configuration Files Successful...!${txtrst}"
echo "Configuration Files are verified" >> $log  
servicerestart
else
echo "${txtred}Verification Unsuccessful, Nagios Sample Configuration Files Error${txtrst}" 
echo "Nagios Configuration Files Error" >> $log 
error
fi
}

addnagios() {
echo ""
echo ""
echo "${txtgrn}Adding Nagios to the list of system services and have it automatically start when the system boots....!${txtrst}"  
echo ""
echo ""
chkconfig --add nagios 
chkconfig nagios on  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Nagios Service Added Successfully to System Services...!${txtrst}"  
echo "Nagios Service Added Successfully to System Services...!" >> $log
verify
else
echo "${txtgrn}Something is Wrong, 'Its OK Still You Can Use Nagios'${txtrst}"
echo "Something is Wrong, 'Its OK Still You Can Use Nagios'" >> $log  
verify
fi
}

installplugin() {
echo ""
echo ""
echo "${txtgrn}Installing Nagios Plugin...!${txtrst}"  
echo ""
echo ""
make install  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Installing Nagios Plugin Successful...!${txtrst}" 
echo "Nagios Plugin Installed" >> $log 
addnagios
else
echo "${txtred}Installing Nagios Plugin Unsuccessful, Something is Wrong 'or' compilation Error...!${txtrst}"  
echo "Plugin Installation Error" >> $log
stop
fi
}

compileplugin() {
echo ""
echo ""
echo "${txtgrn}Compiling Nagios Plugin...!${txtrst}"  
echo ""
echo ""
make  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Compiling Nagios Plugin Successful...!${txtrst}" 
echo "Plugin Compilation Successful" >> $log 
installplugin
else
echo "${txtred}Compiling Nagios Plugin Unsuccessful, Something is Wrong 'or' compilation Error...!${txtrst}"  
echo "Plugin Compilation Error" >> $log
stop
fi
}

configplugin() {
echo ""
echo ""
echo "${txtgrn}Running Nagios Plugin Configuration Script...!${txtrst}"  
echo ""
echo ""
./configure --with-nagios-user=nagios --with-nagios-group=nagios  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Running Nagios Plugin Configuration Script Successful...!${txtrst}"  
echo "${txtgrn}Running Nagios Plugin Configuration Script Successful...!${txtrst}"  >> $log
compileplugin
else
echo "${txtred}Running Nagios Plugin Configuration Script Unsuccessful, Something is Wrong  'or' Configuration Error...!${txtrst}" 
echo "Running Nagios Plugin Configuration Script Unsuccessful, Something is Wrong  'or' Configuration Error...!" >> $log 
stop
fi
}

extractplugin() {
echo ""
echo ""
echo "${txtgrn}Extracting Nagios Plugin...!${txtrst}"  
tar -zxvf $e  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Nagios Plugin Extracted to `pwd`${txtrst}"  
echo "Nagios Plugin Extracted to `pwd`"  >> $log
cd `pwd`/nagios-plugins-1.4.15
configplugin
else
echo "${txtred}Nagios Plugin Not Extracted, Might Be Plugin Not Downloaded Properly 'or' Something is Wrong...!${txtrst}"
echo "Nagios Plugin Not Extracted, Might Be Plugin Not Downloaded Properly 'or' Something is Wrong...!" >> $log 
stop 
fi
}

checkdownload() {
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Nagios Plguin Downloaded Successfully...!${txtrst}" 
echo "Nagios Plugin Downloaded Successfully to /opt/nagios-plugin/" >> $log 
extractplugin
else
echo "${txtred}Nagios Plugin Download Unsuccessful, Somthing is Wrong...!${txtrst}"  
echo "Nagios Plugin Download Stopped, Trying to Download Again" >> $log
echo "${txtred}Trying to Download Again${txtrst}"
wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz/download
extractplugin
fi
}


plugin() {
echo ""
echo ""
echo "${txtgrn}Are You Sure You Dont Want To Download Nagios Plugin${txtrst}"  
echo "${txtgrn}You Cannot use Nagios Without Nagios Plugin${txtrst}"  
echo ""
echo "${txtgrn}Do you want me to download latest nagios plugin ( nagios-plugins-1.4.15.tar.gz ) ? [ y/n ]${txtrst}" 
read line5
if [ "$line5" = "y" ] || [ "$line5" = "Y" ]
then
echo "${txtred}Downloading Nagios-Plugin-1.4.15 ...!${txtrst}"  
mkdir /opt/nagios-plugin  
cd /opt/nagios-plugin  
wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz/download
checkdownload
else
echo ""
echo "${txtred}You Cannot use Nagios Without Nagios Plugin${txtrst}" 
echo "Please Download Nagios Plugin" >> $log 
stop
fi
}


nagiosplugin() {
echo ""
echo ""
echo "${txtgrn}It Seems Like Everything is going good.${txtrst}"  
echo "${txtgrn}To Finallize Nagios installation you need to install Nagios Plugin${txtrst}"  
echo "${txtgrn}Do you want me to download latest nagios plugin ( nagios-plugins-1.4.15.tar.gz ) ? [ y/n ]${txtrst}"
read line4
if [ "$line4" = "y" ] || [ "$line4" = "Y" ]
then
echo ""
echo ""
echo "${txtgrn}Downloading Nagios-Plugin-1.4.15 ...!${txtrst}"  
mkdir /opt/nagios-plugin-1.4.15  
cd /opt/nagios-plugin-1.4.15  
wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz/download
checkdownload
else
echo ""
echo ""
plugin
fi
}


plugindownload() {
echo ""
echo ""
echo "${txtgrn}It Seems Like Everything is going good.${txtrst}"  
echo "${txtgrn}To Finallize Nagios installation you need to install Nagios Plugin${txtrst}"  
echo "${txtgrn}Do you want me to download latest nagios plugin ( nagios-plugins-1.4.15.tar.gz ) ? [ y/n ]${txtrst}"
read line4
if [ "$line4" = "y" ] || [ "$line4" = "Y" ]
then
echo ""
echo ""
echo "${txtgrn}Downloading Nagios-Plugin-1.4.15 ...!${txtrst}"  
mkdir /opt/nagios-plugin-1.4.15  
cd /opt/nagios-plugin-1.4.15  
wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz/download
checkdownload
else
echo ""
echo ""
plugin
fi
}


checknagiospluginfile() {
if [ -f `pwd`/$e ]
then
echo ""
echo "You Have Downloaded Nagios $e to `pwd`"
extractplugin
else
echo ""
echo "Setup Cannot Find Nagios Plugin Downloaded to `pwd`"
echo "Downloading Nagios Plugin...!"
echo "Your System Must be connected to Internet"
echo ""
fi
echo ""
echo "Do You Want Me To Procced Downloading $e ?"
read line
if [ "$line" = "y" ] || [ "$line" = "Y" ]
then
plugindownload
else
plugin
fi
}


checkingpluginpath() {
echo ""
echo ""
echo "This Script Supports Installation of $e "
echo "Which Version of Nagios Plugin You Have Downloaded ?"
echo "Have You Downloaded $e ? [ y/n ] "
read ver
if [ "$ver" = "y" ] || [ "$ver" = "Y" ]
then
echo ""
checknagiospluginfile
else
echo ""
echo "This Script Will Work With $e only...!"
echo ""
fi
echo ""
echo "Do You Want Me to Download Nagios Plugin $e ?"
read line
if [ "line" = "y" ] || [ "line" = "Y" ]
then
plugindownload
else
plugin
fi
}


plugindirectory() {
echo ""
echo "Please enter Full Path Where Nagios Plugin Downloaded ?"  
read pluginpath
echo "Please Confirm Full Path of Nagios Plugin Download Directory $pluginpath[ y/n ] ?"
read line2
if [ "$line2" = "y" ] || [ "$line2" = "Y" ]
then
cd $pluginpath
checkingpluginpath
else
echo ""
fi
echo "Please Enter Full Path Where Nagios Plugin Downloaded ?"
read newpluginpath
echo ""
echo "Please Confirm Full Path of Nagios Plugin Download Directory $newpluginpath[ y/n ] ?"
read line
if [ "$line" = "y" ] || [ "$line" = "Y" ]
then
cd $newpluginpath
checkingpluginpath
else
echo ""
echo "Downloading Nagios Plugin...!"
plugindownload
fi
}


nagiosplugin() {
echo ""
echo ""
echo "${txtgrn}Have you Downloaded Nagios Plugin??? [ y/n ]${txtrst}"
read line
if [ -z "$line" ] || [ "$line" = "y" ] || [ "$line" = "Y" ]
then
plugindirectory
else
plugindownload
fi
}

apache() {
echo ""
echo ""
echo "${txtgrn}Restarting Apache Service....!${txtrst}"  
/etc/init.d/httpd restart  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Restarting Apache Service Successful...!${txtrst}"  
echo "Apache service Restarted" >> $log
nagiosplugin
else
echo ""
echo ""
echo "${txtred}Restarting Apache Service Unsuccessful, Somthing is Wrong...!${txtrst}"
echo "Apache Service Not started" >> $log  
stop
fi
}

webuser() {
echo ""
echo ""
echo "${txtred}Creating a NAGIOSADMIN account for logging into the Nagios web interface....!${txtrst}"  
echo "${txtred}Please Enter Your Password Below & Remember the password you assign to this account you’ll need it later...!${txtrst}"  
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}pls retype your password again & press enter${txtrst}"  
read line6
echo ""
echo ""
echo "${txtgrn}Creating a NAGIOSADMIN account Successful...!${txtrst}"  
echo "Nagiosadmin Account Created" >> $log
apache
else
echo ""
echo ""
echo "${txtred}Creating a NAGIOSADMIN account Unsuccessful, Somthing is Wrong...!${txtrst}"  
echo "NagiosAdmin Account not Created, Something is wrong" >> $log
stop
fi
}

webconfig() {
echo ""
echo ""
echo "${txtgrn}Install The Nagios Web Config File in The Apache conf.d Directory Successful....!${txtrst}"  
make install-webconf  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Install The Nagios Web Config File in The Apache conf.d Directory...!${txtrst}" 
echo "Nagios.conf Installed in /etc/httpd/conf.d/" >> $log 
webuser
else
echo ""
echo ""
echo "${txtred}Install The Nagios Web Config File in The Apache conf.d Directory Unsuccessful, Somthing is Wrong...!${txtrst}" 
echo "Nagios.conf Nor Installed" >> $log
stop
fi
}

commandmode() {
echo ""
echo ""
echo "${txtgrn}Setting Permissions On The External Command Directory...!${txtrst}"  
make install-commandmode  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrb}Setting Permissions On The External Command Directory Successful...!${txtrst}"  
echo "Setting Permissions On The External Command Directory Successful...!" >> $log
webconfig
else
echo ""
echo ""
echo "${txtred}Setting Permissions On The External Command Directory Unsuccessful, Somthing is Wrong...!${txtrst}"  
echo "Setting Permissions On The External Command Directory Unsuccessful, Somthing is Wrong...!" >> $log
stop
fi
}

config() {
echo ""
echo ""
echo "${txtgrn}Installing Sample Config Files...!${txtrst}"  
make install-config  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Installing Sample Config Files Successful...!${txtrst}"
echo "Sample Config Files Installed Check /usr/local/nagios/etc/objects/" >> $log  
commandmode
else
echo ""
echo ""
echo "${txtgrn}Installing Sample Config Files Unsuccessful, Somthing is Wrong...!${txtrst}"
echo "Sample Config Files Not Installed" >> $log  
stop
fi
}

initscript() {
echo ""
echo ""
echo "${txtgrn}Installing Init Script...!${txtrst}"  
make install-init  
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Installing Init Script Successful...!${txtrst}"
echo "Installing Init Script Successful" >> $log  
config
else
echo ""
echo ""
echo "${txtred}Installing Init Script Unsuccessful, Somthing is Wrong...!${txtrst}"  
echo "Init Script Not Installed" >> $log
stop
fi
}

installbin() {
echo ""
echo ""
echo "${txtrgrn}Installing Binaries...!${txtrst}"  
make install  
if [ $? = 0 ]
echo ""
echo ""
then 
echo "${txtgrn}Binaries Installed Successful${txtrst}"
echo "Nagios Binaries Installed" >> $log  
initscript
else
echo "${txtred}Something is Wrong...!${txtrst}"
echo "Binaries Not Installed Something is Wrong" >> $log  
stop
fi
}

compile() {
echo ""
echo "${txtgrn}Compile the Nagios source code...!${txtrst}"  
make all  
if [ $? = 0 ]
then
echo ""
echo "${txtgrn}Nagios source Code Compiled Successful...!${txtrst}"
echo "Nagios Source Code Compiled Successful" >> $log
installbin 
else
echo "${txtred}Something is Wrong${txtrst}"  
echo "${txtred}Cannot Find Problem${txtrst}"  
echo "${txtred}Might be Nagios Prerequesites${txtrst}"  
echo "${txtred}Install Nagios Prerequesites & Run this Script Again${txtrst}"  
echo "Something Went Wrong" >> $log
echo "Cannot Find Problem" >> $log 
echo "Might be Nagios Prerequesites" >> $log 
echo "Install Nagios Prerequesites & Run this Script Again" >> $log
stop
fi
}

finalconfig() {
echo ""
./configure --with-command-group=nagcmd  
if [ $? = 0 ]
then
echo "${txtgrn}Running Nagios Configuration Script Successful${txtrst}"
echo "Running Nagios Configuration Script Successful" >> $log  
compile
else
echo "${txtred}Something is Wrong Sttoping Nagios Installation${txtrst}"  
echo "Something is Wrong Sttoping Nagios Installation" >> $log
stop
fi
}

configscript() {
echo ""
echo ""
if [ -f configure ]
then
echo "${txtgrn}Running Nagios Configuration Script with command group created earlier...!${txtrst}"  
finalconfig
else
echo "${txtgrn}Entering Nagios Extracted directory${txtrst}"  
cd $c
finalconfig
fi
}

useraddgroup() {
echo "${txtgrn}Adding Nagios User & Apache USer to Nagios Group to Allow External Command to run frm Web Interface...!${txtrst}"  
usermod -a -G nagcmd nagios 
usermod -a -G nagcmd apache  
if [ $? = 0 ]
then
echo "${txtgrn}Nagios & Apache User Both Added to Nagios Group${txtrst}"  
echo "Nagios & Apache User Both Added to Nagios Group" >> $log 
configscript
else
echo "${txtred}Nagios User & Apache User Already Added to Group 'or' Something is Wrong...!${txtrst}"  
echo "Nagios User & Apache User Already Added to Group 'or' Something is Wrong...!" >> $log  
configscript
fi
}

nagiosgroup() {
echo "${txtgrn}Adding Nagios Group${txtrst}"  
groupadd nagcmd 
if [ $? = 0 ]
then
echo "${txtgrn}Nagios Group Add Successful${txtrst}"
echo "Adding Nagios Group Successful" >> $log  
echo ""
echo "Press Enter to Continue..."
read line
useraddgroup
else
echo "${txtred}Nagios Group Already Present 'or' Something is wrong...!${txtrst}" 
echo "Nagios Group Already Present 'or' Something is Wrong" >> $log
echo ""
echo "Press Enter to Continue..."
read line
useraddgroup
fi
}

nagiosuseradd() {
echo "${txtgrn}Adding Nagios User${txtrst}"  
useradd -m nagios  
if [ $? = 0 ]
then 
echo "${txtgrn}Nagios UserAdd Successful${txtrst}"  
echo "Nagios Useradd Successful" >> $log
echo ""
echo "Press Enter to Continue..."
read line
nagiosgroup
else 
echo "${txtred}Cannot add Nagios User Something Went Wrong....!${txtrst}"
echo "Cannot Add Nagios User Something Went Wrong Try This Command Manually, 'useradd -m nagios' " >> $log 
echo ""
echo "Press Enter to Continue..."
read line
nagiosgroup
fi
}

checkinguser() {
echo ""
echo "${txtgrn}Checking nagios User${txtrst}"  
id nagios 
if [ $? = 0 ]
then
echo "${txtred}Nagios User Present Skipping Useradd Nagios${txtrst}" 
echo "Nagios User Already Present" >> $log
echo ""
echo "Press Enter to Continue..."
read line
nagiosgroup
else
echo "${txtred}Nagios user Not Found Adding Nagios User${txtrst}"
echo "${txtred}Nagios User Not Found Adding Nagios User${txtrst}" >> $log  
echo ""
echo "Press Enter to Continue..."
read line
nagiosuseradd
fi
}

extract() {
echo ""
echo ""
echo "${txtgrn}Nagios Download successful${txtrst}" 
echo "Nagios Download successful" >> $log  
echo ""
echo "${txtgrn}Nagios Downloaded to `pwd`${txtrst}" 
echo "Nagios Downloaded to `pwd`" >> $log  
echo ""
echo "${txtgrn}Extracting Tar Package${txtrst}"
echo ""
echo "Press Enter to Continue..."
read line 
echo ""
tar -zxvf $a  
cd $c  
checkinguser
}

extractnew() {
echo ""
echo ""
echo "${txtgrn}Nagios Download successful${txtrst}"
echo "Nagios Download successful" >> $log  
echo ""
echo "${txtgrn}Nagios Downloaded to `pwd`${txtrst}"
echo "Nagios Downloaded to `pwd`" >> $log  
echo ""
echo "${txtgrn}Extracting Tar Package${txtrst}"  
echo ""
echo "Press Enter to Continue..."
read line
echo ""
tar -zxvf $b 
cd $d  
checkinguser
}

downloading() {
echo ""
echo "${txtred}downloading nagios from web${txtrst}"  
echo "${txtred}Currently i can download${txtrst}"  
echo "${txtred}nagios-3.2.3.tar.gz${txtrst}"  
echo "${txtred}nagios-3.3.1.tar.gz${txtrst}"  
echo "${txtgrn}Do you want me to download nagios-3.2.3.tar.gz ??? [ y/n ]${txtrst}"  
read line
if [ "$line" = "y" ] || [ "$line" = "Y" ]
then
echo "Downloading Nagios-3.2.3" >> $log
wget http://sourceforge.net/projects/nagios/files/nagios-3.x/nagios-3.2.3/nagios-3.2.3.tar.gz/download
extract
else
echo "" 
fi
echo "${txtgrn}Do you want me to download nagios-3.3.1.tar.gz ??? [ y/n ]${txtrst}"  
read line
if [ "$line" = "y" ] || [ "$line" = "Y" ]
then
echo "Downloading Nagios-3.3.1" >> $log
wget http://sourceforge.net/projects/nagios/files/nagios-3.x/nagios-3.3.1/nagios-3.3.1.tar.gz/download
extractnew
else
stop
fi
}

download() {
echo "${txtgrn}I am Going to download nagios for you...!${txtrst}"  
echo "${txtgrn}checking your system connected to internet???${txtrst}"  
host google.com >> /dev/null
if [ $? = 0 ]
then
echo ""
echo ""
echo "${txtgrn}Your system is connected to Internet${txtrst}" 
echo "Your System is Connected to Internet" >> $log 
echo ""
echo "Press Enter to Continue..."
read line
echo ""
downloading
else
echo ""
echo ""
echo "${txtred}Your System is Not Connected to Internet Can Not Download Nagios, Please Connect Your Internet...!${txtrst}"  
echo "Your System is Not Connected to Internet Can Not Download Nagios" >> $log
stop
fi
}


checknagiosagain() {
if [ -f `pwd`/$b ]
then
echo ""
echo "${txtgrn}You Have Downloaded Nagios $b ${txtrst}"
echo "You Have Downloaded Nagios $b" >> $log
extractnew
else
echo "${txtgrn}You Have Entered Wrong Download Directory...! ${txtrst}"
echo "${txtgrn}Nagios Package Not Found in `pwd` ${txtrst}"
echo "Nagios Package Not Found in `pwd`" >> $log
stop
fi
}


checknagiosfile() {
if [ -f `pwd`/$a ]
then
echo ""
echo "${txtgrn}You Have Downloaded Nagios $a ${txtrst}"
extract
else
echo ""
echo "${txtgrn}You Have Enter Wrong Nagios Version ${txtrst}"
checknagiosagain
fi
}


checkingpath() {
echo ""
echo ""
echo "${txtgrn}This Script Supports Installation of $a & $b ${txtrst}"
echo "${txtgrn}Which Version of Nagios You Have Downloaded ?${txtrst}"
echo "${txtgrn}Have You Downloaded $a ? [ y/n ] ${txtrst}"
read ver
if [ "$ver" = "y" ] || [ "$ver" = "Y" ]
then
echo ""
checknagiosfile
else
echo ""
fi
echo "${txtgrn}Have You Downloaded $b ? [ y/n ] ${txtrst}"
read vers
if [ "$vers" = "y" ] || [ "$vers" = "Y" ]
then
echo ""
checknagiosagain
else
stop
fi
}


directory() {
echo ""
echo "${txtgrn}Please enter path Where Nagios Downloaded ?${txtrst}"  
read path
echo "${txtgrn}Please Confirm Nagios Download Directory $path[ y/n ]${txtrst}"
read line2
if [ "$line2" = "y" ] || [ "$line2" = "Y" ]
then
cd $path
checkingpath
else
echo "${txtgrn}Please Enter Path Where Nagios Downloaded ?${txtrst}"
read newpath
echo ""
echo "${txtgrn}Please Confirm Nagios Download Directory $newpath[ y/n ]${txtrst}"
read line
cd $newpath
checkingpath
fi
}


#############################################################################################################################

first() {
echo ""
echo ""
echo "${txtred}Hi this script currently supports installation of Nagios 3.2.3 & Nagios 3.3.1${txtrst}"  
echo ""
echo "${txtgrn}Do you want me to continue ? [ y/n ]${txtrst}"
read lane
if [ "$lane" = "y" ] || [ "$lane" = "Y" ]
then
echo ""
echo "${txtgrn}OK fine I am going to Continue with this script...!${txtrst}"  
else
stop
fi
}

osguess() {
echo ""
if [ -f /etc/debian_version ]
then
echo "${txtgrn}Your Operating System is ${txtbld}`cat /etc/debian_version`${txtrst}"
echo "Your Operating System is `cat /etc/debian_version`" > $log
echo ""
echo "Press Enter to Continue..."
read line
else
echo ""
echo "${txtred}Sorry Cannot Guess Your Operating System${txtrst}"
echo "Can not Guess your Operating System" >> $log  
echo ""
echo "Press Enter to Continue..."
read line
fi
}

debapache() {
echo ""
echo "${txtgrn}Checking apache is installed ???${txtrst}"  
if [ -f /etc/apache2/apache2.conf ]
then
echo ""
echo "${txtgrn}Apache is Installed${txtrst}"
echo "Apache is Installed" >> $log
echo "" 
else
echo ""
echo "${txtred}Sorry setup cannot find apache server installed nagios installatioin aborted${txtrst}"  
echo "Apache Not Installed Installation Aborted" >> $log
exit 1
fi
}

###########################################################################################################################################

echo ""
echo ""
echo "${txtred}Hi Nagios Installation Requires
 
***** Apache *****
***** PHP *****
***** GCC compiler *****
***** GD development libraries *****
${txtrst}
"
read line
echo ""
echo "${txtred}First Install Above Pre-requesites Then continue with this script${txtrst}"
echo "${txtred}or You will face problems with installation nagios${txtrst}"
echo ""
echo "${txtred}You can Install Pre-requeesites using following commands${txtrst}"
echo "${txtred}To install Apache >>> yum install httpd${txtrst}"
echo "${txtred}To install PHP >>> yum install php${txtrst}"
echo "${txtred}To install GCC compiler >>> yum install gcc glibc glibc-common${txtrst}"
echo "${txtred}To install GD development libraries >>> yum install gd gd-devel${txtrst}"
echo ""
echo ""
echo "${txtred}If You have already installed pre-requesites ignore above warning & continue with this script...!"
echo "${txtgrn}Do You Want to continue with this script? [ y/n ]${txtrst}"
read line
if [ "$line" = "y" ] || [ "$line" = "Y" ]
then
echo ""
else
stop
fi
echo ""
echo ""
echo "${txtgrn}Hi this script currently supports installation of Nagios 3.2.3 & Nagios 3.3.1${txtrst}"  
echo ""
echo "${txtgrn}Do you want me to continue ? [ y/n ]${txtrst}"
read lane
if [ "$lane" = "y" ] || [ "$lane" = "Y" ]
then
echo ""
echo "${txtgrn}OK fine I am going to Continue with this script...!${txtrst}"  
else
stop
fi

echo "${txtylw}${txtbld}Trying to Guess Your operating system ${txtrst}"  
echo ""
if [ -f /etc/redhat-release ]
then
echo "${txtgrn}Your Operating System is ${txtbld}`cat /etc/redhat-release`${txtrst}"
echo "Your Operating System is `cat /etc/redhat-release`" > $log
echo ""
echo "Press Enter to Continue..."
read line
else
osguess
fi

echo ""
echo ""
# Check Apache is Installed 
echo -n "${txtgrn}Can you tell me apache server is installed ??? [ y/n ]${txtrst}"  
read line 
if [ -z "$line" ] || [ "$line" = "y" ] || [ "$line" = "Y" ]
then
echo "${txtgrn}Now you can continue${txtrst}" 
echo "Checking Apache is Installed" >> $log 
else 
echo "${txtred}Sorry Setup cannot find apache installed${txtrst}"  
echo "Apache Not Installed" >> $log
echo "${txtred}First install apache server Thank you Bye Bye${txtrst}"  
echo ""
echo "Press Enter to Continue..."
read line
exit 1
fi
echo ""
echo "${txtgrn}Checking apache is installed ???${txtrst}"  
if [ -f /etc/httpd/conf/httpd.conf ]
then
echo ""
echo "${txtgrn}Apache is Installed${txtrst}"
echo "Apache is Installed" >> $log
echo "" 
else
echo ""
debapache
fi
echo ""
echo ""
echo "${txtgrn}Have you Downloaded Nagios Package??? [ y/n ]${txtrst}"
read line
if [ -z "$line" ] || [ "$line" = "y" ] || [ "$line" = "Y" ]
then
directory
else
download
fi




