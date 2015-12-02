# The first lines of your Dockerfile should always be:
FROM hypriot/rpi-python
MAINTAINER Leo Fidjeland (leo.fidjeland@gmail.com)
# This indicates what base image you are using and who maintains the Dockerfile.

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python && \
    apt-get autoremove -y wget ca-certificates

RUN apt-get update && apt-get install -y gcc && \
    pip install paho-mqtt crcmod && \
    apt-get autoremove -y gcc

RUN apt-get install -y rsync
RUN mkdir /plugwise && mkdir /plugwise/data && mkdir /plugwise/log && touch /plugwise/data/pwlastlog.log

ADD src /opt/plugwise
RUN cd /opt/plugwise && python setup.py install

WORKDIR /opt/plugwise
CMD ["python","/opt/plugwise/Plugwise-2.py"]
