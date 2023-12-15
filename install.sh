#!/bin/sh
clear
SALIR=0
OPCION=0
while [ $SALIR -eq 0 ]; do
   echo "Menu:"
   echo "1) ros-noetic-base"
   echo "2) ros-noetic-desktop + moveit"
   echo "3) ros-noetic-desktop-full (recommended)"
   echo "4) config ROS Noetic container"
   echo "5) Salir"
   echo "Opcion seleccionada: "
   read OPCION
   case $OPCION in
       1)
           docker pull ros:noetic-robot ;;
       2)
           echo "Opcion 2 seleccionada" ;;
       3)
           docker build -t ros_noetic ./ros-noetic-desktop-full/;
           SALIR=1 ;;
       4)
           chmod +x ./ros-noetic-desktop-full/ros_noetic_config.sh
           ./ros-noetic-desktop-full/ros_noetic_config.sh
           SALIR=1 ;;
       5)
           chmod +x ./ros-noetic-desktop-full/ros_noetic_config.sh
           ./ros-noetic-desktop-full/ros_noetic_config.sh
           SALIR=1 ;;
       6)
           SALIR=1 ;;
       *)
         echo "Opcion erronea";;
   esac
done

