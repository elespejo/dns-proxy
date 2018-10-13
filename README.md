
[![Alt text](https://www.lucidchart.com/publicSegments/view/fd12f5ad-ac4c-4e36-99d1-d806c6b07ae0/image.png)](https://www.lucidchart.com/publicSegments/view/fd12f5ad-ac4c-4e36-99d1-d806c6b07ae0/image.png)
<h1 align="center"> dns proxy </h1>
<p align="center">
  <b >dns-proxy is a port-forwarding solution of anti dns pollution</b>
</p>
<br>

[![GitHub release](https://img.shields.io/github/release/elespejo/dns-proxy.svg)](https://github.com/elespejo/dns-proxy/releases)
![Github All Releases](https://img.shields.io/github/downloads/elespejo/dns-proxy/total.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/elespejo/dns-proxy-x86.svg)](https://hub.docker.com/r/elespejo/dns-proxy/tags/)
[![Docker Automated build](https://img.shields.io/docker/automated/elespejo/dns-proxy-x86.svg)](https://hub.docker.com/r/elespejo/dns-proxy-x86/)
[![Docker Build Status](https://img.shields.io/docker/build/elespejo/dns-proxy-x86.svg)](https://hub.docker.com/r/elespejo/dns-proxy-x86/builds/)
![GitHub](https://img.shields.io/github/license/elespejo/dns-proxy.svg)
![Travis (.org) branch](https://img.shields.io/travis/elespejo/dns-proxy.svg)


# Deployment (for end user)

### Download and unzip
* Check the [release](https://github.com/elespejo/dns-proxy/releases) 
* Choose the version you need, mostly the latest one, download `dns-proxy-[VERSION].zip` by following options:
  * from the web
  * from command line, e.g, download version `0.0.6` 
    ```
    wget https://github.com/elespejo/dns-proxy/releases/download/0.0.6/dns-proxy-0.0.6.zip
    ``` 
* Unzip
```
unzip dns-proxy-0.0.6.zip
```
The unzipped folder is called `imageAPI`

### Configurate dns-proxy
```
cd imageAPI
make config WAN=eth0 DNSPORT=12340:12350 NAME=dnsproxy
```
* `WAN` is the interface to accept dns request
* `DNSPORT` is the port range to accept dns request

### Start dns-proxy service
```
make start NAME=dnsproxy
```

### Check the status of dns-proxy service
```
make status NAME=dnsproxy
```

### Stop the dns-proxy service
```
make stop NAME=dnsproxy
```
# Getting Started (for developer)

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

`Docker` should be installed

### Build

```
make mk-image
```
will create a docker image locally

### Test

Follow the `Deployment` steps to run the service

# Logistics

### Contributing

Please read [CONTRIBUTING.md](https://github.com/meninasx86/dns-proxy/blob/master/docs/CONTRIBUTING.md) for contributing.
For details on our [code of conduct](https://github.com/meninasx86/dns-proxy/blob/master/docs/CODE_OF_CONDUCT.md), and the process for submitting pull requests to us.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository

### Authors

* **mateomartin1998** - *Initial work* - [mateomartin1998](https://github.com/mateomartin1998)

See also the list of [contributors](https://github.com/meninasx86/dns-proxy/graphs/contributors) who participated in this project.

### Acknowledgments

See [Acknowledgments](https://github.com/meninasx86/dns-proxy/blob/master/docs/ACKNOWLEDGMENTS.md)


### License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/meninasx86/dns-proxy/blob/master/LICENSE.md) file for details


