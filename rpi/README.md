# Raspberry Pi build

This is the raspberry pi build of the same project. Try to keep it as similar as possible to the parent project.


## Raspberry Pi Quickstart

```
git clone https://github.com/op-en/plugwise
cd plugwise/rpi
docker-compose up -d
```

## Building

To build the image on raspberry pi, from the root folder:

```
docker build -t plugwise -f rpi-Dockerfile .
```
