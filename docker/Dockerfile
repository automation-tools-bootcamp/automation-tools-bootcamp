# Version: 0.0.1
FROM node:0.10
MAINTAINER Graham Dunn "gmd@kurai.org"

# See if you can do this w/o looking at Dockerfile.example
# Create a directory at /usr/src/app
RUN mkdir -p /usr/src/app

# copy (or add) package.json to /usr/src/app
COPY package.json /usr/src/app

# copy (or add) app.js to /usr/src/app
COPY app.js /usr/src/app

# Set the container's working directory to /usr/src/app
WORKDIR /usr/src/app

# run 'npm install' to install the prerequisties for app.sj
RUN npm install

# Open port 3000 into the container
EXPOSE 3000

# Specify command to run when the container is launched.
# Use an array of arguments to avoid issues with `/bin/sh -c`
CMD ["npm", "start"]

# If that worked, try rebuilding in different ways....
