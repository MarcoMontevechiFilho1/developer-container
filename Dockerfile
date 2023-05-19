FROM ubuntu:22.04

COPY ./installers /tmp

RUN apt-get update;
RUN apt-get -y install curl;
RUN cd /tmp; bash /tmp/mamba;

ENV PATH="${PATH}:/root/mambaforge/bin"