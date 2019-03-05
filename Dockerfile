FROM java:8

RUN apt-get update
RUN apt-get install fuse -y
RUN mkdir -p /test/jnrmount

COPY target /tmp/jnr-target
COPY run.sh /

WORKDIR /
CMD sh run.sh