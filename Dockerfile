# The first lines of your Dockerfile should always be:
FROM hypriot/rpi-python
MAINTAINER Leo Fidjeland (leo.fidjeland@gmail.com)
# This indicates what base image you are using and who maintains the Dockerfile.

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python && \
    apt-get autoremove -y wget ca-certificates

RUN apt-get update && apt-get install -y gcc
RUN pip install paho-mqtt
ADD src /opt/plugwise
WORKDIR /opt/plugwise
RUN python setup.py install

RUN mkdir /plugwise && mkdir /plugwise/data && mkdir /plugwise/log && touch /plugwise/data/pwlastlog.log

RUN apt-get install -y rsync
CMD python Plugwise-2.py
