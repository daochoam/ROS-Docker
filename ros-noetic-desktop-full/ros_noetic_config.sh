#!/bin/bash

# Establecer un directorio por defecto
DIRECTORIO_POR_DEFECTO="Docker/ROS/"

# Verificar si se proporcionó el directorio como argumento
if [ $# -eq 0 ]; then
    read -p "Enter the location of the swap directory (or press Enter to use the default directory: $DIRECTORIO_POR_DEFECTO): " DIRECTORIO_INGRESADO
    if [ -z "$DIRECTORIO_INGRESADO" ]; then
        DIRECTORIO="$DIRECTORIO_POR_DEFECTO"
    else
        DIRECTORIO="$DIRECTORIO_INGRESADO"
    fi
else
    DIRECTORIO="$1"
fi

# Combinar el directorio proporcionado con la carpeta personal del usuario
DIRECTORIO_COMPLETO=~/"$DIRECTORIO"

# Crear el directorio especificado
mkdir -p "$DIRECTORIO_COMPLETO"

# Obtiene la ruta absoluta del archivo .Xauthority
XAUTHORITY_ABSOLUTE=$(realpath "$XAUTH.Xauthority")

# Resto del comando Docker
docker run -it \
    --privileged \
    --name=ros-noetic \
    --net=host \
    --publish=192.168.0.6:8080:8080/tcp \
    --publish=8888:8888/tcp \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="NVIDIA_VISIBLE_DEVICES=all" \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --env="XAUTHORITY=$XAUTHORITY_ABSOLUTE" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTHORITY_ABSOLUTE:$XAUTHORITY_ABSOLUTE" \
    --volume="/tmp/.docker.xauth:/tmp/.docker.xauth:rw" \
    --volume="$DIRECTORIO_COMPLETO:$DIRECTORIO_COMPLETO" \
    ros_noetic

# Anunciar el directorio de intercambio
echo "Swap directory: $DIRECTORIO_COMPLETO"
