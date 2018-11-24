# Work flow
### Download the project
```bash
git clone https://github.com/elespejo/dns-proxy.git
cd dns-proxy/
```

### Build docker image
After modifying the Dockerfile, use the command below to build the docker  image:
```bash
make mk-image ARCH=[arch]
```
The `arch` can be `x86`.
This action build a docker image named `elespejo/dns-proxy-[arch]:latest` by using the resource in directory `image`.

### Clean docker image
```bash
make clean-image ARCH=[arch]
```
This action remove the docker image named `elespejo/dns-proxy-[arch]:latest`.

### Build dns-proxy x86 image API
```bash
make mk-imageAPI VERSION=[version]
```

### Build configuration generator
```bash
make mk-confgenerator VERSION=[version]
```

### Build all package
```bash
make mk-deployment VERSION=[version]
```

### Build gitbook
```bash
make mk-book