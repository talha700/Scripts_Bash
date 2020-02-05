#!/bin/bash



HOST=$1
START=$2
END=$3


for (( PORT=$START; PORT<=$END; PORT++ ))
do

  timeout 0.75 bash -c  "echo < /dev/tcp/${HOST}/$PORT" &&
    echo -e "port \e[1;32m ${PORT} \e[0m is open ! \n " ||
    echo -e  "port \e[0;31m ${PORT} \e[0m is closed"

done
