# Open Energy Plugwise

This is part of the [Open Energy Project](http://op-en.se/), a research project aiming to make it easier and faster to prototype smart energy services.

## Description

This is a fork of [a python script](https://github.com/SevenW/Plugwise-2-py) that communicates with plugwise smart energy plugs.

But dockerized!!!

Raspberry Pi build available in the [rpi folder](https://github.com/op-en/plugwise/tree/master/rpi)

Note: The intel/amd version is just a draft atm. Haven't got it to work properly in boot2docker... Use a Pi meanwhile :()

## Quickstart

```
git clone https://github.com/op-en/plugwise
cd plugwise
```

Configure like the step below. And then:

```
docker-compose up -d
```

## Configure

You need to configure the script to use the mac adress of your plug. The files pw-conf.json and pw-control.json in the root folder are examples of configuration.

When that is done, we are ready to start the container.

These files need to be mapped into the container to the locations

/opt/plugwise/config/pw-conf.json
/opt/plugwise/config/pw-control.json

If you use docker-compose, this will be done automatically.

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
