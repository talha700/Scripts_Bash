#!/bin/bash



if [[ ${UID} != 0 ]]
then
	echo "Error: Run This Script With Root Permission" 1>&2
	exit 1
fi


#Display hostname info
for i in {1..50}; do echo -n = ; done ; echo -n "NAME,OS,KERNEL" ; for i in {1..50}; do echo -n =; done
printf '\n'

hostnamectl | sed -n -e 1p -e 6,7p

#Display cpu info
for i in {1..50}; do echo -n = ; done ; echo -n "CPU INFO" ; for i in {1..50}; do echo -n =; done
printf '\n'

lscpu | sed -n -e 14p -e 1p -e 8p -e 16,18p -e 7p -e 20,24p

#Display RAM info
for i in {1..50}; do echo -n = ; done ; echo -n "RAM INFO" ; for i in {1..50}; do echo -n =; done
printf '\n'

free -h
dmidecode --type 17 | sed -n -e 12p -e 16p -e 24p -e 27p | sed 's/^[ \t]*//;s/[ \t]*$//'

#Display Disk info
for i in {1..50}; do echo -n = ; done ; echo -n "DISK USAGE INFO" ; for i in {1..50}; do echo -n =; done
printf '\n'

lsblk

#Display network info
for i in {1..50}; do echo -n = ; done ; echo -n "TRAFFIC INFO" ; for i in {1..50}; do echo -n =; done
printf '\n'

netstat -i

#Display firewall info
for i in {1..50}; do echo -n = ; done ; echo -n "FIREWALL STATUS" ; for i in {1..50}; do echo -n =; done
printf '\n'

timeout 1 ufw status 2> /dev/null  || firewall-cmd --list-all

for i in {1..50}; do echo -n = ; done ; echo -n "USERS LOGGED IN ?" ; for i in {1..50}; do echo -n =; done
printf '\n'

w


exit 0
