# Version: 0.0.1
FROM node:0.10
MAINTAINER Johann Agnarsson <johannagnarsson@gmail.com>
EXPOSE 3000

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app/

COPY package.json /usr/src/app/
COPY app.js /usr/src/app/
RUN npm install
CMD [ "npm", "start" ]
