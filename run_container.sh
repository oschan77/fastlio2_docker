#!/bin/bash
mkdir -p docker_ws/BAG docker_ws/PCD

# Allow X server to be accessed from the local machine
xhost +local:

# Container name
CONTAINER_NAME="fastlio2"

# Run the Docker container
docker run -itd \
  --name=$CONTAINER_NAME \
  --user mars_ugv \
  --network host \
  --ipc=host \
  -v /home/$USER/fastlio2_docker/docker_ws:/home/mars_ugv/docker_ws \
  --privileged \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/etc/localtime:/etc/localtime:ro" \
  -v /dev/bus/usb:/dev/bus/usb \
  --device=/dev/dri \
  --group-add video \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --env="DISPLAY=$DISPLAY" \
  oschan77/lscm_unimap_fastlio2:latest \
  /bin/bash
