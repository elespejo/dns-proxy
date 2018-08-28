#!/bin/bash
filename="$0"
image="meninasx86/dns-proxy"
version="test"
WAN="enp0s25" 
DNSPORT="16350:16370"

Usage(){
    echo "Usage: $filename <command>"
    echo "command options:"
    echo "  start   start $container service"
    echo "  stop    stop $container service"
    echo "  status  display the status of $container service"
}

START(){
    docker run --rm -itd --cap-add=NET_ADMIN --network=host --privileged -e WAN=${WAN} -e DNSPORT=${DNSPORT} ${image}:${version}
}

STOP(){
    docker run --rm -itd --cap-add=NET_ADMIN --network=host --privileged -e WAN=${WAN} -e DNSPORT=${DNSPORT} --entrypoint="./clean" ${image}:${version}
}

STATUS(){
    sudo iptables -L -nv -t nat
}

if [ "$#" -ne 1 ]; then
    Usage
else
    case "$1" in
        start)
            START
            STATUS
            ;;
        stop)
            STOP
            STATUS
            ;;
        status)
            STATUS
            ;;       
        *)
            Usage
            ;;
    esac
fi
