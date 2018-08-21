FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
&& apt-get install -y software-properties-common \
&& add-apt-repository ppa:rvm/smplayer \
&& apt-get update \
&& apt-get -y install smplayer smplayer-themes smplayer-skins

RUN useradd -ms /bin/bash smplayer

VOLUME [ "/home/smplayer/videos" ]

USER smplayer
ENV HOME /home/smplayer
CMD [ "/usr/bin/smplayer", "/videos" ]