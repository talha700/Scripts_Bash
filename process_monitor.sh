#!/bin/bash



if [[ -z $1 ]]
then
	echo "Give Process Name"
	exit 1
fi


#Monitor a process

while ps aux | grep $1 | grep -v grep > /dev/null
do
	sleep 4
done

logger -t $0 "Process $1 has stopped working"
mail -s "Your Process $1  has stopped" root < .

exit 0

