FROM stackbrew/ubuntu:13.10
RUN apt-get update -qq
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update -qq
RUN apt-get install -y nodejs phantomjs libfreetype6
ADD package.json /code/
WORKDIR /code
RUN npm install -g grunt-cli
RUN npm install
ADD . /code/
VOLUME /code
CMD ["npm", "test"]
