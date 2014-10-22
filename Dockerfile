FROM ubuntu:12.04

MAINTAINER yujilow


# Ubuntu update
RUN apt-get update

#Install Utility
RUN apt-get install -y wget unzip

#Install java
RUN apt-get install -y openjdk-7-jre

#Install Play Framework
ENV PLAY_VERSION 1.2.7
RUN wget http://downloads.typesafe.com/play/$PLAY_VERSION/play-$PLAY_VERSION.zip
RUN unzip play-$PLAY_VERSION.zip
RUN mv play-$PLAY_VERSION /usr/local/play
ENV PATH $PATH:/usr/local/play

#Attach app folder
VOLUME /mnt

#Port
EXPOSE 9000

#Start Play app
CMD play run /mnt