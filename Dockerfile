FROM ubuntu:18.04

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

RUN apt-get update
RUN yes | apt-get install -y --no-install-recommends wireshark
RUN apt-get install -y --no-install-recommends \
    curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    openvswitch-switch \
    openvswitch-testcontroller \
    tcpdump \
    tcpreplay \
    vim \
    x11-xserver-utils \
    xterm \
    git \
    openssh-client \
    wget \
    tshark \
    argus-server \
    argus-client \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /ENTRYPOINT.sh

# HACK around https://github.com/dotcloud/docker/issues/5490
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
