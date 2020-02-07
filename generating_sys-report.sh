#!/bin/bash




if [[ ${UID} != 0 ]]
then
        echo "Error: Run This Script With Root Permission"
        exit 1
fi

BEAUTIFY() {
        for i in {1..50}; do echo -n = ; done

}

#Display hostname info
BEAUTIFY ; echo -n "NAME,OS,KERNEL" ; BEAUTIFY
printf '\n'

hostnamectl | sed -n -e 1p -e 6,7p

#Display cpu info
BEAUTIFY ; echo -n "CPU INFO" ;  BEAUTIFY
printf '\n'

lscpu | sed -n -e 14p -e 1p -e 8p -e 16,18p -e 7p -e 20,24p

#Display RAM info
BEAUTIFY ; echo -n "RAM INFO" ; BEAUTIFY
printf '\n'

free -h && echo " "
sudo dmidecode --type 17 | sed -n -e 12p -e 16p -e 24p -e 27p | sed 's/^[ \t]*//;s/[ \t]*$//'

#Display Disk info
BEAUTIFY ; echo -n "DISK USAGE INFO" ; BEAUTIFY
printf '\n'

df -h

#Display network info
BEAUTIFY ; echo -n "TRAFFIC INFO" ; BEAUTIFY
printf '\n'

netstat -i

#Display firewall info
BEAUTIFY; echo -n "FIREWALL STATUS" ; BEAUTIFY
printf '\n'

timeout 1 ufw status 2> /dev/null  || firewall-cmd --list-all

BEAUTIFY; echo -n "USERS LOGGED IN ?" ; BEAUTIFY
printf '\n'

w


exit 0 
