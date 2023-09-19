FROM ubuntu:20.04
LABEL maintainer="DANIEL OCHOA <daochoam@unal.edu.co>"

# Install packages without prompting the user to answer any questions
ENV DEBIAN_FRONTEND noninteractive 

# Install packages
RUN apt-get update && apt-get install -y \
locales lsb-release mesa-utils git wget iputils-ping \
telnet curl libssl-dev build-essential dbus-x11 \
software-properties-common gdb valgrind && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Install repository universe & python3
RUN apt-add-repository universe
RUN apt-get update && apt-get install -y python3-pip python build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*

# Locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Install ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
libpcap-dev libopenblas-dev gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev \
ros-noetic-desktop-full python3-rosdep python3-rosinstall-generator python3-vcstool python3-catkin-tools \
ros-noetic-socketcan-bridge ros-noetic-geodesy ros-noetic-abb-driver && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Install VSCode
RUN apt-get update && apt-get install -y gnupg2
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && echo "deb [signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list \
    && apt-get update && apt-get install -y code \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure ROS
RUN rosdep init && rosdep update 
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "export ROSLAUNCH_SSH_UNKNOWN=1" >> /root/.bashrc
RUN echo "source /opt/ros/noetic/setup.zsh" >> /root/.zshrc
RUN echo "export ROSLAUNCH_SSH_UNKNOWN=1" >> /root/.zshrc

# Configurar la variable ROS_IP
ENV ROS_IP=127.0.0.1

# Configurar la variable ROS_MASTER_URI
ENV ROS_MASTER_URI=http://localhost:11311

RUN apt-get update

# Ejecutar el comando bash al iniciar el contenedor
CMD ["bash"]
