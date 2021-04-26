#Renommer les cartes reseau

echo GRUB_DEFAULT=0 > /etc/default/grub
echo GRUB_TIMEOUT=0 >> /etc/default/grub
echo GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian` >> /etc/default/grub
echo GRUB_CMDLINE_LINUX_DEFAULT="quiet" >> /etc/default/grub
echo GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname" >> /etc/default/grub

#Mettre a jour le grub qu'on vient de modifier

update-grub

#Autoriser debian a installer des programmes proprietaires et a installer drbl

echo deb http://deb.debian.org/debian/ buster main contrib non-free > /etc/apt/sources.list
echo deb-src http://deb.debian.org/debian/ buster main contrib non-free >> /etc/apt/sources.list
echo deb http://security.debian.org/debian-security buster/updates main contrib non-free >> /etc/apt/sources.list
echo deb-src http://security.debian.org/debian-security buster/updates main contrib non-free >> /etc/apt/sources.list
echo deb http://deb.debian.org/debian/ buster-updates main contrib non-free >> /etc/apt/sources.list
echo deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free >> /etc/apt/sources.list
wget -q http://drbl.org/GPG-KEY-DRBL -O- | apt-key add -
echo deb http://ftp.us.debian.org/debian/ buster main >> /etc/default/sources.list
echo deb http://free.nchc.org.tw/drbl-core drbl stable >> /etc/default/sources.list

#Mettre a jour la liste qu'on vient de modifier

apt update

#Desinstaller le programme qui met l'ecran a l'envers et installer la wifi
apt remove iio-sensor-proxy -y
apt install firmware-iwlwifi -y

#Installer DRBL
apt install drbl -y

apt install feh -y

feh --bg-fill https://w.wallhaven.cc/full/4l/wallhaven-4lpd7l.jpg

#Redemarrer pour que les changements prennent effet
reboot
