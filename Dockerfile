## Base Image for NodeJS
FROM node:current-slim

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy Code to working directory
COPY todo-app/. /app/

# To Solve debconf: delaying package configuration, since apt-utils is not installed for cypress dependecies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

## Step 3:
# Install needed packages  
RUN apt-get update -y && npm install
RUN apt-get install libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y

## Step 4:
# Expose port 1024
EXPOSE 1024

## Step 5:
# Run app at container launch
CMD yarn serve --host  ec2-3-234-253-125.compute-1.amazonaws.com --disable-host-check --port 1024
#CMD yarn serve --port 1024

ENV DEBIAN_FRONTEND=teletype
