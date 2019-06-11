#!/bin/bash
mkdir .retropie_img
echo "Copying files. This will take a while..."
cp -r ../.retropie_img/mnt-copy .retropie_img/mnt-copy
echo "Copy finished. Launching docker compose..."
docker-compose up
