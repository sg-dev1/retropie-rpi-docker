FROM scratch

COPY .retropie_img/mnt-copy/ /

RUN chown -R pi.pi /home/pi
RUN chown -R pi.pi /opt/retropie/configs/all/emulationstation

RUN usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input pi

USER pi

