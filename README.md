# Open Energy Plugwise

This is part of the [Open Energy Project](http://op-en.se/), a research project aiming to make it easier and faster to prototype smart energy services.

## Description

This is a fork of a python script that communicates with plugwise smart energy plugs.

It has been dockerized!

Raspberry Pi build available in the [rpi folder](https://github.com/op-en/plugwise/tree/master/rpi)

## Quickstart

```
git clone https://github.com/op-en/plugwise
cd plugwise
docker-compose up -d
```

## Run it

To get the mqtt messages, you need to link a docker container running an mqtt broker (like mosquitto, rabbitmq etc.) to this container.

So if you have an mqtt container up with the name mosquitto, run plugwise like this:

```
docker run --device=/dev/ttyUSB0 --link mosquitto:mqtt -d plugwise
```

If you use the compose script, it automatically links the containers.

## Building

```
docker build -t plugwise .
```
