# Retropie Docker Image

Purpose of this project is to get Retropie running in a docker container on a Raspberry Pi.

To create and start the image run the docker-build-and-run.sh script.

## Details

The process is split up into two images:
  * retropie_download to download the latest retropie raspberry pi release from 
    https://github.com/RetroPie/RetroPie-Setup/releases which is then extracted
    and copied into a local directory
  * retropie The retropie image which gets populate with the filesystem of the
    image downloaded from the RetroPie-Setup github page and runs the
    /usr/bin/emulationstation binary

It was tested on a Raspberry Pi 3 running HypriotOS v1.10.0

## Troubleshooting

### "SDL init failed"
- Check your /boot/config.txt and check if you have allocated enough GPU memory
- Setting it 'gpu_mem = 256' should be fine on a Raspberry Pi 3
- Tested on a Raspberry Pi 3 running HypriotOS v1.10.0
   ´´´
   $ uname -a
   Linux black-pearl 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux
   $ docker --version
   Docker version 18.06.3-ce, build d7080c1
   ´´´
