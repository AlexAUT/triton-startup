#!/bin/bash
 
env_file="./.env"
 
VAR=$(getent group | grep -Po "video:\w:\K\d+") && echo "VIDEO_GROUP=${VAR}" > ${env_file}
VAR=$(getent group | grep -Po "render:\w:\K\d+") && echo "RENDER_GROUP=${VAR}" >> ${env_file}
echo "MUID=$(id -u)" >> ${env_file}
echo "MGID=$(id -g)" >> ${env_file}
echo "USER=$(whoami)" >> ${env_file}

echo "Enter docker image to spin up: "
read DOCKER_IMAGE
echo "TRITON_DOCKER_IMAGE=$DOCKER_IMAGE" >> ${env_file}