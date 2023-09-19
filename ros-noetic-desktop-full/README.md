# ROS-NOETIC (Dockerfile)

Este archivo README proporciona información sobre el script Dockerfile y el script ros_config presentes en este repositorio. El script Dockerfile se utiliza para construir una imagen de Docker basada en Ubuntu 20.04 que incluye una variedad de herramientas y software útiles para el desarrollo de aplicaciones robóticas y de visión por computadora. A continuación, se detallan los pasos y las herramientas que se instalan en la imagen.

## Dockerfile - Imagen ROS-NOETIC

La imagen Docker generada por este script incluye los siguientes componentes y herramientas:

1. **Sistema Operativo**: Ubuntu 20.04.

2. **Mantenimiento**: El mantenedor de esta imagen es DANIEL OCHOA (<daochoam@unal.edu.co>).

3. **Variables de Entorno**: Se establece la variable de entorno `DEBIAN_FRONTEND` como `noninteractive` para evitar que los paquetes se instalen con interacción del usuario.

4. **Paquetes Básicos**:
   - `locales`: Configuración de locales.
   - `lsb-release`: Herramienta de identificación de distribución.
   - `mesa-utils`: Utilidades de Mesa.
   - `git`, `wget`, `iputils-ping`, `telnet`, `curl`: Herramientas de red y desarrollo.
   - `libssl-dev`, `build-essential`, `dbus-x11`, `software-properties-common`, `gdb`, `valgrind`: Herramientas de desarrollo y bibliotecas esenciales.

5. **Repositorio Universe y Python 3**:
   - Se agrega el repositorio `universe`.
   - Se instala Python 3 y pip.

6. **Configuración de Locale**: Se genera el locale `en_US.UTF-8` y se establecen variables de entorno relacionadas con el locale.

7. **Instalación de ROS**:
   - Se agrega el repositorio de ROS (ROS Noetic) a las fuentes de paquetes.
   - Se obtiene y configura la clave GPG de ROS.
   - Se instalan varios paquetes relacionados con ROS, como `ros-noetic-desktop-full`, `python3-rosdep`, `python3-rosinstall-generator`, `python3-vcstool`, `python3-catkin-tools`, `ros-noetic-socketcan-bridge`, `ros-noetic-geodesy`, y `ros-noetic-abb-driver`.

8. **Instalación de Visual Studio Code (VSCode)**:
   - Se instalan las claves y los repositorios necesarios para VSCode.
   - Se instala VSCode.

9. **Configuración de ROS**:
   - Se inicializa y actualiza `rosdep`.
   - Se configuran las variables de entorno para que el entorno ROS esté disponible en el shell.

10. **Configuración de Variables de Entorno ROS**:
    - Se configura la variable `ROS_IP` como `127.0.0.1`.
    - Se configura la variable `ROS_MASTER_URI` como `http://localhost:11311`.

11. **Actualización de Paquetes**: Se actualizan los paquetes del sistema antes de finalizar.

12. **Comando Predeterminado**: Cuando se ejecuta un contenedor basado en esta imagen, el comando predeterminado es iniciar un shell Bash.

## Configuración del Contenedor ROS-NOETIC

Este script de bash facilita la ejecución y creación de un contenedor Docker configurado para trabajar con ROS (Robot Operating System). A continuación, se describen las funciones del script y cómo utilizarlo:

## Descripción del script

El script `ros_noetic_config.sh` realiza las siguientes acciones:

1. **Establece un directorio por defecto:** Define un directorio por defecto (`DIRECTORIO_POR_DEFECTO`) donde se almacenarán los datos intercambiados entre el sistema anfitrión y el contenedor Docker de ROS.

2. **Verifica el directorio proporcionado:** Comprueba si se ha proporcionado un directorio como argumento al ejecutar el script. Si no se proporciona ningún argumento, el script solicita al usuario que ingrese la ubicación del directorio de intercambio. El usuario puede presionar Enter para utilizar el directorio por defecto.

3. **Combina el directorio proporcionado:** Establece la ubicación ingresada (o el directorio por defecto) en la carpeta personal del usuario.

4. **Crea el directorio de intercambio:** Se crea el directorio de intercambio especificado (o el directorio por defecto si no se proporcionó ninguno) en el sistema anfitrión.

5. **Obtiene la ruta absoluta del archivo `.Xauthority`:** Este paso obtiene la ruta absoluta del archivo `.Xauthority`, que es necesario para el funcionamiento de las aplicaciones gráficas dentro del contenedor Docker.

6. **Ejecuta el contenedor Docker de ROS:** Utiliza el comando `docker run` para ejecutar un contenedor Docker de ROS con las siguientes configuraciones:
   - `--privileged`: Permite que el contenedor acceda a dispositivos de hardware del sistema anfitrión.
   - `--name=ros-noetic`: Asigna un nombre al contenedor como "ros-noetic".
   - `--net=host`: Utiliza la red del sistema anfitrión.
   - `--publish=192.168.0.6:8080:8080/tcp` y `--publish=8888:8888/tcp`: Publica puertos desde el contenedor al sistema anfitrión.
   - `--env`: Establece variables de entorno necesarias, como la variable `DISPLAY` para aplicaciones gráficas, configuraciones para dispositivos NVIDIA, y la ubicación del archivo `.Xauthority`.
   - `--volume`: Monta directorios del sistema anfitrión dentro del contenedor, incluyendo el directorio de intercambio y los archivos relacionados con X11.
   - `ros_noetic`: Utiliza la imagen Docker llamada `ros_noetic`.

7. **Anuncia el directorio de intercambio:** Finalmente, el script muestra la ubicación del directorio de intercambio creado para que el usuario lo conozca.

## Instrucciones para ejecutar el script

A continuación se describen los pasos para ejecutar el script `ros-docker.sh`:

1. Abre una terminal en tu sistema.

2. Navega hasta la ubicación donde se encuentra el archivo `ros_noetic_config.sh`.

3. Asegúrate de que el archivo `ros-docker.sh` tenga permisos de ejecución. Si no los tiene, ejecuta el siguiente comando para otorgarlos:

   ```bash
   chmod +x ros-docker.sh
   ```

4. Ejecuta el script `ros_noetic_config.sh` usando el siguiente comando:

   ```bash
   ./ros-docker.sh [DIRECTORIO_DE_INTERCAMBIO]
   ```

   - `[DIRECTORIO_DE_INTERCAMBIO]` (opcional): Puedes proporcionar un directorio personalizado para el intercambio de datos. Si no proporcionas este argumento, el script te pedirá que ingreses la ubicación o simplemente presiones Enter para usar el directorio por defecto.

5. Sigue las instrucciones proporcionadas por el script para seleccionar el directorio de intercambio y, posteriormente, se iniciará el contenedor Docker de ROS.

Una vez que hayas ejecutado el script, tendrás un entorno de desarrollo de ROS Noetic en un contenedor Docker listo para su uso. El directorio de intercambio se mostrará al final del proceso para que puedas acceder a él desde tu sistema anfitrión.
