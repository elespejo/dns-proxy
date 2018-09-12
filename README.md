# DNS-Proxy 

Port forward solution of anti dns pollution

[![Alt text](https://www.lucidchart.com/publicSegments/view/b268a1c2-ef1f-45b2-8b46-e3fde328a4e8/image.png)](https://www.lucidchart.com/publicSegments/view/b268a1c2-ef1f-45b2-8b46-e3fde328a4e8/image.png)

# Deployment (for end user)

### Through script

* Fetch the code
  ```
  git clone https://github.com/meninasx86/dns-proxy.git
  ```

* Start dns proxy
  ```
  ./ctl start <WAN> <PORT RANGE>
  ```

  in which, 
    * `WAN` is the WAN interface in the VPS 
    * `PORTRANGE` is the port range in syntax `start_port:end_port` 

  eg,

    ```
    ./ctl start eth0 12345:12350 
    ```

* Check the status
  ```
  ./ctl status
  ```

* Stop dns proxy
  ```
  ./ctl stop
  ```

### Through docker cli

* Start dns proxy 
  ```
  docker run -itd --restart=always --cap-add=NET_ADMIN --network=host --name dns_proxy --privileged -e WAN=${WAN} -e DNSPORT=${PORTRANGE} meninasx86/dns-proxy:test 
  ``` 

  in which, 

    * `${WAN}` is the WAN interface in the VPS 
    * `${PORTRANGE}` is the port range in syntax `start_port:end_port` 

* Stop 
  ```
  docker exec -it dns_proxy ./clean 
  ```

# Getting Started (for developer)

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

`Docker` should be installed

### Build

```
./build
```
will create a docker image locally

### Test

Follow the `Deployment` steps to run the service, `./ctl status` will help you to identify whether the service is functional.

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


