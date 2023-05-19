FROM ubuntu:22.04

RUN apt-get update;

#I like nano...
RUN apt-get install -y nano;

#installing mamba
RUN apt-get -y install curl;

COPY ./installers/mamba /tmp
RUN cd /tmp; bash /tmp/mamba;

#Epics dependencies
RUN apt-get install -y git make g++ gcc wget re2c;

#Install epics and all the needed stuff
COPY ./installers/base.sh /tmp
RUN bash /tmp/base.sh

COPY ./installers/sequencer.sh /tmp
RUN bash /tmp/sequencer.sh

COPY ./installers/autosave.sh /tmp
RUN bash /tmp/autosave.sh

COPY ./installers/sscan.sh /tmp
RUN bash /tmp/sscan.sh

COPY ./installers/ipac.sh /tmp
RUN bash /tmp/ipac.sh

COPY ./installers/calc.sh /tmp
RUN bash /tmp/calc.sh

COPY ./installers/asyn.sh /tmp
RUN bash /tmp/asyn.sh

COPY ./installers/busy.sh /tmp
RUN bash /tmp/busy.sh

COPY ./installers/alive.sh /tmp
RUN bash /tmp/alive.sh

COPY ./installers/deviocstats.sh /tmp
RUN bash /tmp/deviocstats.sh

COPY ./installers/areadetector.sh /tmp
RUN bash /tmp/areadetector.sh

#COPY ./installers/streamdevice.sh /tmp
#RUN bash /tmp/streamdevice.sh

#To be able to find conda command
#ENV PATH="${PATH}:/root/mambaforge/bin"