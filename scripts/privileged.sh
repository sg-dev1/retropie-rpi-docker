#!/bin/bash

VERSION_MAJOR=4.4
MOUNT_DIR=/workspace/mount
MOUNT_DIR_COPY=/workspace/mnt-copy
IMAGE_DIR=/workspace/images

IMAGE_NAME=retropie-${VERSION_MAJOR}-rpi2_rpi3.img
IMAGE_ABS=$IMAGE_DIR/$IMAGE_NAME
IMAGE_ARCHIVE_NAME=${IMAGE_NAME}.gz
IMAGE_ARCHIVE_ABS=$IMAGE_DIR/$IMAGE_ARCHIVE_NAME

DOWNLOAD_URL=https://github.com/RetroPie/RetroPie-Setup/releases/download/$VERSION_MAJOR/$IMAGE_ARCHIVE_NAME

# setup - create dirs
if [ ! -f /workspace ]; then
  mkdir /workspace
fi
cd /workspace
if [ ! -f /workspace/images ]; then
  mkdir /workspace/images
fi
if [ ! -f $MOUNT_DIR ]; then
  mkdir $MOUNT_DIR
fi

# download
if [ ! -f $IMAGE_ARCHIVE_ABS ]; then
  wget $DOWNLOAD_URL -O $IMAGE_ARCHIVE_ABS
fi

echo "download finished"

# extract
if [ ! -f $IMAGE_ABS ]; then
  gunzip -c $IMAGE_ARCHIVE_ABS > $IMAGE_ABS
fi

echo  "extract finished"

# mount
echo "Mounting $MOUNT_DIR"
losetup -D
ROOT_OFFSET=`fdisk -u -l ${IMAGE_ABS} | grep ${IMAGE_ABS}2 | tail -n 1 | awk '{print $2}'`
#local BOOT_OFFSET=`fdisk -u -l ${IMAGE_ABS} | grep ${IMAGE_ABS}1 | tail -n 1 | awk '{print $3}'`
IMAGE_LOOP=$(losetup -v -f --show $IMAGE_ABS)
#local IMAGE_LOOP2=$(losetup -v -f --show $IMAGE_ABS)
mount -o offset=$((512*${ROOT_OFFSET})) "$IMAGE_LOOP" $MOUNT_DIR

# copy everything from mounted image
echo "Rsync $MOUNT_DIR --> $MOUNT_DIR_COPY"
rsync -av --exclude "sys" $MOUNT_DIR/ $MOUNT_DIR_COPY/

# cleanup
umount -l $MOUNT_DIR




