#!/usr/bin/env bash

function usage()
{
    echo "Usage:"
    echo "  ./printerFinder.sh -n [IP/NetworkSegment] [-p/-k] [Port/Keywords]"
    echo ""
    echo "Example:"
    echo "  ./printerFinder.sh -n 192.168.1.123 -p 9100"
    echo "  ./printerFinder.sh -n 192.168.1.123 -k printer"
    echo ""
    echo "  ./printerFinder.sh -n 192.168.1.0/24 -p 9100"
    echo "  ./printerFinder.sh -n 192.168.1.0/24 -k printer"
    echo ""
}

if [ "$#" != "4" ] || [ "$1" != "-n" ] || !([ "$3" == "-p" ] || [ "$3" == "-k" ])
then
    usage
    exit 1
fi

if ! type nmap > /dev/null
then
    echo "Install nmap first: apt-get install nmap"
    exit 1
fi

network_segment="$2"
filter="$4"

nmap -sP "$network_segment" | while read line
do
    available_ip=`echo -n "$line"\
        | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'`

    if [ ! "$available_ip" ]
    then
        continue
    fi

    result=`nmap -PS "$available_ip"`
    if [ "`echo "$result" |  grep "$filter" | wc -l`" == "0" ]
    then
        echo "Scanned $available_ip, printer not found."
    else
        echo "==== $available_ip has printer ===="
        echo "$result"
        echo "-------------------------------------"
        echo ""
    fi
done
