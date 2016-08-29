echo "Running action: Install private key for repo"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sleep 3 clear
echo "Running action: Add Mono Repository"
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sleep 3
clear
echo "Running action: Update Upgrade Packages"
sudo apt-get -y update && apt-get -y upgrade
sleep 3
clear
echo "Running action: Install Mono"
apt-get -y install mono-complete
sleep 3
clear
echo "Completed action: Install Mono"
