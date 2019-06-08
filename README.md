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
