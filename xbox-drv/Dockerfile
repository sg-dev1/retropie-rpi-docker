FROM ubuntu:latest

RUN apt-get update && apt-get install -y xboxdrv

#ENTRYPOINT "xboxdrv --detach-kernel-driver --silent"
CMD ["xboxdrv", "--detach-kernel-driver", "--silent"]
