# Generate configuration

### Download the configuration generator
You can download the generator package from web page or command line.

* From web:  
    Go to the [release page](https://github.com/elespejo/dns-proxy/releases) of this project and download `dns-proxy-confgenerator-[VERSION].zip`.

* From command line:  
    ```bash
    wget https://github.com/elespejo/dns-proxy/releases/download/[VERSION]/dns-proxy-confgenerator-[VERSION].zip
    ```
    e.g, download configuration generator of version 0.8.2
    ```bash
    wget https://github.com/elespejo/dns-proxy/releases/download/0.8.2/dns-proxy-confgenerator-0.8.2.zip
    ```

### Unzip
```bash
unzip dns-proxy-confgenerator-[VERSION].zip
```
e.g:
```bash
unzip dns-proxy-confgenerator-0.8.2.zip
cd dns-proxy-confgenerator/
```

### Modify the conf-info  
The template conf-info is the `dns-proxy-info.yml` in unzipped confgenerator package.
```bash
ls dns-proxy-confgenerator/
confgenerator  dns-proxy-info.yml
```
Modify the conf-info `dns-proxy-info.yml`.
```yaml
# dns-proxy-info.yml
WAN: enp0s25
DNSPORT: 12345:12356
```
Explanation of environment variables:
* [WAN] : The interface name of your machine's wan.
* [DNSPORT] : The range of ports that you want to expose as a dns port.

### Generate configuration
```
python -m confgenerator.cli -f [conf-info path] -d [configuration path]
```
* [conf-info path] : the absolute path of conf-info file.
* [configuration path] : the directory path of generated configuration.

e.g:
```
python -m confgenerator.cli -f ~/dns-proxy-confgenerator/dns-proxy-info.yml -d ~/dns-proxy-config/
```
The configurations are generated in `~/dns-proxy-config/`.