 
#!/bin/bash



usage() {
        echo "Usage: $0  [-mu] [-d directory]"
        exit 1
}

while getopts d:mu OPTION
do
        case ${OPTION} in
                m)
                        DISPLAY_MEM='true'
                        ;;
                u)
                        DISPLAY_CPU='true'
                        ;;
                d)
                        DISPLAY_DISK='true'
                        DIRECTORY=${OPTARG}
                        ;;
                ?)
                        usage
                        ;;
        esac
done

#Display top 5 processes with high memory usage
if [[ "${DISPLAY_MEM}" = 'true' ]]
then

    for i in {1..50}; do echo -n = ; done ; echo -n "PROCESS WITH HIGH MEMORY USAGE (^5)" ; for i in {1..50}; do echo -n =; done
    printf "\n"
    ps aux | sort -rnk 4 | head -n5 | awk '{print NR ,"-->" ,$0 ,'\n' }'; printf "\n"

fi




# Display top 5 processes with high cpu usage
if [[ ${DISPLAY_CPU} == 'true' ]]
then

    for i in {1..50}; do echo -n =; done ; echo -n "PROCESS WITH HIGH CPU USAGE (^5)" ; for i in {1..50}; do echo -n =; done
    printf "\n"
    ps aux | sort -rnk 3 | head -n5 | awk '{print NR ,"-->" ,$0 ,'\n' }'; printf "\n"
fi



#Display Directories with high disk usage
if [[ ${DISPLAY_DISK} == 'true' ]]
then

    for i in {1..50}; do echo -n =; done ; echo -n "DIRECTORIES WITH HIGH DISK USAGE (^5)" ; for i in {1..50}; do echo -n =; done ; printf "\n"
    du -h "${DIRECTORY}"  | sort -rh | head -n5
fi

printf "\n"



exit 0
