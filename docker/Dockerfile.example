# Version: 0.0.1
FROM node:0.10
MAINTAINER Tyler Fitch "automationtools@tfitch.com"
EXPOSE 8085

RUN mkdir -p /usr/src
WORKDIR /usr/src

# Clone the conf files into the docker container
RUN git clone https://github.com/automation-tools-bootcamp/example-nodejs-app.git

WORKDIR /usr/src/example-nodejs-app
RUN npm install

CMD [ "npm", "start" ]
