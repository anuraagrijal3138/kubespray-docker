FROM ubuntu:18.04

USER root

COPY requirements.txt .

RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y python3-pip && \
  apt-get install --no-install-recommends -y python-netaddr && \
  apt-get install -y iproute2 && \
  apt-get install -y ansible

RUN pip3 install -r requirements.txt

COPY ansible.cfg /etc/ansible/ansible.cfg

RUN mkdir /ansible
WORKDIR /ansible

