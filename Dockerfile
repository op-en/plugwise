# The first lines of your Dockerfile should always be:
FROM hypriot/rpi-python
MAINTAINER Leo Fidjeland (leo.fidjeland@gmail.com)
# This indicates what base image you are using and who maintains the Dockerfile.

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python && \
    apt-get autoremove -y wget ca-certificates

ADD src /opt/plugwise
WORKDIR /opt/plugwise
RUN apt-get update && \
  apt-get install -y gcc && \
  python setup.py install && \
  apt-get purge -y --auto-remove gcc

RUN mkdir /plugwise && mkdir /plugwise/data && mkdir /plugwise/log && touch /plugwise/data/pwlastlog.log
CMD python Plugwise-2.py
