#!/bin/bash

IMAGE_NAME=toy-imitation
CONTAINER_NAME=toy-imitation
CURRENT_DIR=$(pwd)

xhost +

docker run -itd \
  --name $CONTAINER_NAME \
  --rm \
  --gpus all \
  --network=host \
  --ipc=host \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -e MUJOCO_GL=egl \
  -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python \
  -v $HOME/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $CURRENT_DIR:/workspace:rw \
  -w /workspace \
  $IMAGE_NAME \
  bash