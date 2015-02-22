#!/bin/bash

aptitude update
aptitude -y full-upgrade

#needed for npm-kludge-search
aptitude install zip

#needed for npm, it expects a node binary but nodejs package install nodejs binary
ln -s /usr/bin/nodejs /usr/bin/node

npm install -g npm

# yay npm seach fails on low-mem VMs if this doesn't happen
npm config set jobs 1
npm install -g npm-kludge-search

npm install -g yo

mkdir /var/www/icbc_video/app
chown nemitek.nemitek /var/www/icbc_video/app
chmod 0777 /var/www/icbc_video/app

npm install -g yo bower grunt-cli generator-webapp
