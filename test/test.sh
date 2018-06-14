#! /bin/bash


# usage

usage() {
	echo "$0 [linode|vultr] [server IP]"
}

if [ "$#" != 2 ]; then
	usage
	exit
elif [[ ( "$1" != "linode" ) && ( "$1" != "vultr" ) ]]; then
	usage
	exit
fi




confirm() {
    while true; do
        read -p "Do you wish to continue? [y/n]" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}


# # install ${package}


package="ssh-rpc-agent"
executable=${package}-amd64
version="0.0.4"

download() {
	wget https://github.com/FuQiFeiPian/${package}/releases/download/${version}/${executable}
	chmod +x ${executable}
}

download


# TEST FLOW

# run dns-proxy deployment

run() {
	cat machines.json
	echo "Please check the content in machines.json"
	task=dns-server/task_deploy_dns_server_$1.json

	./${executable} --tf ${task} --mf machines.json
}
run $1 

# display dns-proxy status

status(){
	echo "Check the status of the dns-proxy"
	task=dns-server/check_status.json
	./${executable} --tf ${task} --mf machines.json
	confirm
	echo "Check dns functionality"
	dig @$1 -p 15360 www.google.com
	confirm
}	
status $2

# uninstall dns-proxy

uninstall(){
	echo "Check the status of the dns-proxy"
	task=dns-server/uninstall.json
	./${executable} --tf ${task} --mf machines.json
}
uninstall