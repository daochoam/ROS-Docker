# Imagen base de Ubuntu con ROS Noetic instalado
FROM ros:noetic-robot

RUN apt update

# Install packages without prompting the user to answer any questions
ENV DEBIAN_FRONTEND noninteractive 


RUN apt-get update && apt-get install -y python3-pip python build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install packages
RUN apt-get update && apt-get install -y \
locales lsb-release mesa-utils git wget curl libssl-dev build-essential dbus-x11 software-properties-common gdb valgrind \
libpcap-dev libopenblas-dev gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev \
python3-pip python python3-rosdep python3-rosinstall-generator python3-vcstool python3-catkin-tools \
ros-noetic-socketcan-bridge ros-noetic-geodesy && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Instalar dependencias adicionales necesarias para MoveIt y RViz
RUN apt-get update && apt-get install -y \
    ros-noetic-moveit \
    ros-noetic-moveit-visual-tools \
    ros-noetic-rviz \
    ros-noetic-rqt ros-noetic-rqt-common-plugins \
    ros-noetic-rqt-robot-plugins ros-noetic-rqt-pr2-dashboard \
    ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configurar el entorno de trabajo de ROS
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "export ROSLAUNCH_SSH_UNKNOWN=1" >> /root/.bashrc
RUN echo "source /opt/ros/noetic/setup.zsh" >> /root/.zshrc
RUN echo "export ROSLAUNCH_SSH_UNKNOWN=1" >> /root/.zshrc

# Configurar la variable ROS_IP
ENV ROS_IP=127.0.0.1

# Configurar la variable ROS_MASTER_URI
ENV ROS_MASTER_URI=http://localhost:11311
# Ejecutar el comando bash al iniciar el contenedor
CMD ["bash"]