#!/bin/bash

sudo xhost +local:docker

#!/bin/bash

# Verificar si se ejecuta el script con sudo
if [ "$EUID" -ne 0 ]; then
    # No se ejecuta con sudo, obtén el nombre de usuario del sistema local
    DIR_DEFAULT="Docker/ROS/"
else
    # Se ejecuta con sudo, establece la ruta predeterminada para el usuario "docker"
    DIR_DEFAULT="home/Docker/ROS"
fi

# Verificar si se proporcionó el directorio como argumento
if [ $# -eq 0 ]; then
    read -p "Enter the location of the swap directory (or press Enter to use the default directory: $DIR_DEFAULT): " DIR_INTRODUCE
    if [ -z "$DIR_INTRODUCE" ]; then
        DIRECTORY="$DIR_DEFAULT"
    else
        DIRECTORY="$DIR_INTRODUCE"
    fi
else
    DIRECTORY="$1"
fi

# Combinar el directorio proporcionado con la carpeta personal del usuario
CREATE_DIR=~/"$DIRECTORY"

# Crear el directorio especificado
mkdir -p "$CREATE_DIR"

# Obtiene la ruta absoluta del archivo .Xauthority
XAUTHORITY_ABSOLUTE=$(realpath "$XAUTH.Xauthority")

# Resto del comando Docker
docker run -it \
    --privileged \
    --name=ros-noetic \
    --network=bridge \
    --publish=192.168.1.0:8080:8080/tcp \
    --publish=8888:8888/tcp \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="NVIDIA_VISIBLE_DEVICES=all" \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --env="XAUTHORITY=$XAUTHORITY_ABSOLUTE" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTHORITY_ABSOLUTE:$XAUTHORITY_ABSOLUTE" \
    --volume="/tmp/.docker.xauth:/tmp/.docker.xauth:rw" \
    --volume="$CREATE_DIR:$CREATE_DIR" \
    ros_noetic

# Anunciar el directorio de intercambio
echo "Swap directory: $CREATE_DIR"