FROM scratch

COPY .retropie_img/mnt-copy/ /

RUN chown -R pi.pi /home/pi
RUN chown -R pi.pi /opt/retropie/configs/all/emulationstation

RUN usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input pi


RUN apt-get -y install xboxdrv

# set version for s6 overlay
ARG OVERLAY_VERSION="v1.22.0.0"
ARG OVERLAY_ARCH="arm"

RUN \
echo "**** add s6 overlay ****" && \
 curl -o \
 /tmp/s6-overlay.tar.gz -L \
	"https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-${OVERLAY_ARCH}.tar.gz" && \
 tar xfz /tmp/s6-overlay.tar.gz -C /
# xboxdrv init script
COPY ./run /etc/services.d/xboxdr/run
ENTRYPOINT ["/init"]

#CMD ["/usr/bin/execlineb", "-P", "-c", "emptyenv export HOME /home/pi export TERM xterm s6-setuidgid pi /usr/bin/emulationstation"]
# for testing to launch a bash in the container
CMD ["/usr/bin/execlineb", "-P", "-c", "emptyenv export HOME /home/pi s6-setuidgid pi /bin/bash"]
