FROM ubuntu:14.04
MAINTAINER patrickocox@gmail.com

RUN apt-get -qqy update
RUN apt-get -qqy install git nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN apt-get install -y vim
RUN git clone https://github.com/krishnasrinivas/wetty.git
WORKDIR /wetty
RUN npm install
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
