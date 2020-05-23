#!/bin/sh

# Install packages
npm install

# Running unit tests
yarn test:unit

# Running e2e tests
yarn test:e2e --headless

# Start the app on port 1024
yarn serve --host $1 --disable-host-check --port 1024
