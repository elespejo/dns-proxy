#!/bin/bash

project=`cd $(dirname $0);pwd`
working_dir="/etc/dnsproxy"
template="$project/template"

Usage() {
    echo "Usage: $0 { install [WAN] [PORTS] | uninstall | restart | status }"
    exit 1
}

Parameter_judge() {
    correct_num="$1"
    real_num="$2"
    if [ "$correct_num" != "$real_num" ];then
        Usage
    fi
}

Config() {
    wan="$1"
    dns_port="$2"

    sudo mkdir -p $working_dir

    cp $template/dns-port-forward.template dns-port-forward
    sed -i "s/interface/$wan/g" dns-port-forward
    chmod +x dns-port-forward
    sudo mv dns-port-forward $working_dir/

    cp $template/dns-proxy.service.template dns-proxy.service
    sed -i "s/PORT/$dns_port/g" dns-proxy.service
    sudo mv dns-proxy.service /etc/systemd/system/
}

Restore() {
    sudo rm -r $working_dir
    sudo rm /etc/systemd/system/dns-proxy.service
}

Start() {
    for cmd in "enable" "start" "status"
    do
        sudo systemctl $cmd dns-proxy.service
    done
}

Stop() {
    for cmd in "disable" "stop" "status"
    do 
        sudo systemctl $cmd dns-proxy.service
    done
	sudo systemctl daemon-reload
}

Status() {
    echo "iptables nat"
    sudo iptables -t nat -S
    echo -e "\niptables filter"
    sudo iptables -t filter -S
}

case "$1" in 
    install)
        Parameter_judge 3 $# 
        Config $2 $3
        Start 
        ;;

    uninstall)
        Parameter_judge 1 $#
        Stop
        Restore
        ;;

    restart)
        Parameter_judge 1 $#
        Stop
        Start
        ;;

    status)
        Parameter_judge 1 $#
        Status
        ;;

    *)
        Usage
        ;;
esac
