#!/bin/bash
#
# This script will block in the end
# To run it without blocking, e.g. use
# $> nohup ./docker-build.sh &
# In this we you can also quit the ssh connection
# while build is proceeding.
#

# First build the download image and a container of it (in privileged mode)
docker-compose -f docker-compose-2.yml up

# fix permissions
sudo chown -R pirate:pirate .retropie_img/

# run the build of the final image
docker-compose up
