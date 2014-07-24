FROM ubuntu:14.04
MAINTAINER patrickocox@gmail.com

RUN apt-get -qqy update && \
 apt-get -qqy install git nodejs npm && \
 ln -s /usr/bin/nodejs /usr/bin/node

#Install Wetty
RUN git clone https://github.com/krishnasrinivas/wetty.git
WORKDIR /wetty
RUN npm install && \
 apt-get install -y vim && \
 useradd -d /home/term -m -s /bin/bash term && \
 echo 'term:term' | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
