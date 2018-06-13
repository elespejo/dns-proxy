# dns-proxy-x86


## Usage
### Install project :
```
    ./dns-proxy-control.sh install [WAN] [PORT]
```
WAN:    the name of your machine's WAN interface
PORT:   
* which listen to dns requests and redirect the requests to the local dns server
* which can be a number or a range of number,e.g :15350, 123, 15360:15370 


### Uninstall project :
```
    ./dns-proxy-control.sh uninstall
```

### Restart project :
```
    ./dns-proxy-control.sh restart
```

### Get status
```
    ./dns-proxy-control.sh status
```

