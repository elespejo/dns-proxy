# Deployment

### Download the deployment package
    
You can download the deployment package from web page or command line.

* From web:  
Go to the [release page](https://github.com/elespejo/dns-proxy/releases) of this project. Select the package according to the architecture of your machine.

* From command line:  
```bash
wget https://github.com/elespejo/dns-proxy/releases/download/[VERSION]/dns-proxy-imageAPI-[VERSION].zip
```
  * VERSION : the release tag  
  * ARCH : the architecture of your machine 

  e.g : Deploy a dns-proxy on a x86 machine with the release 0.1.7 by executing
  ```bash
  wget https://github.com/elespejo/dns-proxy/releases/download/0.1.7/dns-proxy-x86-0.1.7.zip
  ```

### Unzip

```bash
unzip dns-proxy-imageAPI-[VERSION].zip
cd dns-proxy-imageAPI/
```

### Config the environment variable file

The template of the config environment variables file is the `config.env` in the imageAPI directory.
```env
WAN=[WAN]
DNSPORT=[start:end]
```
Explanation of environment variables:
* [WAN] : The interface name of your machine's wan.
* [DNSPORT] : The range of ports that you want to expose as a dns port.

e.g: Expose the port from `12345` to `12356` as the dns port with the machine's wan name `enp0s25`.
```env
# ~/config.env
WAN=enp0s25
DNSPORT=12345:12356
```

### Generate the docker compose file

Docker compose file is used for dns-proxy deployment. Its generation requires those parameters:
* [CONFIG_ENV] : The config environment variables file for dns-proxy.
* [NAME] : The name for one dns-proxy service which is used as mark for control.

```bash
make config CONFIG_ENV=[path to config env] NAME=[NAME]
```

e.g : Config a service named `dns-proxy` with config env file path `~/config.env`.
```
make config CONFIG_ENV=~/config.env NAME=dns-proxy
```
Therefore a compose file named `dns-proxy.yml` is generated in `~/dns-proxy-imageAPI/compose/`.
```yaml
# dns-proxy.yml
services:
  dns-proxy:
    cap_add:
    - NET_ADMIN
    environment:
      DNSPORT: 12345:12356
      WAN: enp0s25
    image: elespejo/dns-proxy-x86:0.1.7
    network_mode: host
    privileged: true
    restart: unless-stopped
    tty: true
version: '3.0'
```
For testing configed instance , use another makefile target 'test_config':
```bash
make test_config NAME=[NAME]
```

### Start the service
Start the service with the name you specified in the config step above.
```bash 
make start NAME=[COMP_NAME]
```
e.g: start service `dns-proxy`
```bash
make start NAME=dns-proxy
```
After starting the service successfully, you may see the output similar with the following: 
```
docker-compose -p dns-proxy -f ~/dns-proxy-imageAPI/compose/dns-proxy.yml up -d
Creating dns-proxy_dns-proxy_1 ... done
```

### Restart the service
```bash
make restart NAME=[COMP_NAME]
```
e.g
```bash
make restart NAME=dns-proxy
```
After restarting the service successfully, you may see the output similar with the following:
```
docker-compose -p dns-proxy -f ~/dns-proxy-imageAPI/compose/dns-proxy.yml up -d --force-recreate
Recreating dns-proxy_dns-proxy_1 ... done
```

### Check status of the service
```bash
make status NAME=[COMP_NAME]
```
e.g,
```bash
make stop NAME=dns-proxy
```

You may see the output similar with the following:
```
docker-compose -p dns-proxy -f ~/dns-proxy-imageAPI/compose/dns-proxy.yml ps || true
        Name                  Command         State   Ports
-----------------------------------------------------------
dns-proxy_dns-proxy_1   /bin/sh -c ./config   Up
docker-compose -p dns-proxy -f ~/dns-proxy-imageAPI/compose/dns-proxy.yml logs || true
Attaching to dns-proxy_dns-proxy_1
sudo iptables -t nat -L PREROUTING -nv | grep 8.8.8.8
    0     0 DNAT       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:12345:12356 to:8.8.8.8:53
sudo iptables -t nat -L POSTROUTING -nv | grep 8.8.8.8
    0     0 SNAT       udp  --  *      *       0.0.0.0/0            8.8.8.8              udp dpt:53 to:192.168.21.5
```

### Stop the service
```bash
make stop NAME=[COMP_NAME]
```
e.g,
```bash
make stop NAME=dns-proxy
```
After stopping the service successfully, you may see the output similar with the following:
```
docker-compose -p dns-proxy -f ~/dns-proxy-imageAPI/compose/dns-proxy.yml exec dns-proxy ./clean
docker-compose -p dns-proxy -f ~/dns-proxy-imageAPI/compose/dns-proxy.yml down
Stopping dns-proxy_dns-proxy_1 ... done
Removing dns-proxy_dns-proxy_1 ... done
```

### List the services
```bash
make list
```
You may see the output similar with the following:
```
for compose in `ls ~/dns-proxy-imageAPI-x86/compose`;do name=`echo $compose|awk -F "." '{print $1}'`;echo $name;docker-compose -p $name -f ~/dns-proxy-imageAPI-x86/compose/$compose ps;done
dns-proxy
Name   Command   State   Ports
------------------------------
...
```

### Remove the compose file
```bash
make remove NAME=[COMP_NAME]
```
e.g,
```bash
make remove NAME=dns-proxy
```
You may see the output similar with the following:
```
rm ~/dns-proxy-imageAPI-x86/compose/dns-proxy.yml
```
Check whether the remove step successfully:
```bash
ls compose | grep dns-proxy
```

