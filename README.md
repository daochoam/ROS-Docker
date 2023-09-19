# Instrucciones para ejecutar `install.sh`

Este archivo `install.sh` es un script de shell que facilita la instalación de diferentes configuraciones de ROS Noetic en un entorno de contenedor Docker. A continuación, se describen los pasos para ejecutar el script y las opciones disponibles:

## Requisitos previos
1. Asegúrate de tener Docker instalado en tu sistema. Puedes obtenerlo [aquí](https://docs.docker.com/get-docker/).

## Pasos para ejecutar `install.sh`

1. Abre una terminal en tu sistema.

2. Navega hasta la ubicación donde se encuentra el archivo `install.sh`.

3. Asegúrate de que el archivo `install.sh` tenga permisos de ejecución. Si no los tiene, ejecuta el siguiente comando para otorgarlos:

   ```bash
   chmod +x install.sh
   ```

4. Ejecuta el script `install.sh` usando el siguiente comando:

   ```bash
   ./install.sh
   ```

5. Aparecerá un menú que te permitirá elegir entre diferentes configuraciones de ROS Noetic. Las opciones disponibles son las siguientes:

   - `1) ros-noetic-base`: Descarga la imagen Docker de ROS Noetic base.
   - `2) ros-noetic-desktop + moveit`: Esta opción aún no está implementada en el script.
   - `3) ros-noetic-desktop-full (recommended)`: Construye una imagen Docker personalizada llamada `ros_noetic` basada en `ros-noetic-desktop-full`.
   - `4) config ROS Noetic container`: Configura un contenedor ROS Noetic después de construir la imagen en la opción 3.
   - `5) Salir`: Sale del script.

6. Selecciona la opción que desees ingresando el número correspondiente y presionando Enter.

7. Dependiendo de tu elección, el script realizará las siguientes acciones:
   - Para la opción 1, descargará la imagen Docker de ROS Noetic base.
   - Para la opción 2, mostrará un mensaje de que la opción aún no está implementada.
   - Para la opción 3, construirá una imagen personalizada llamada `ros_noetic` basada en `ros-noetic-desktop-full`.
   - Para la opción 4, configurará el contenedor ROS Noetic después de construir la imagen en la opción 3.
   - Para la opción 5, el script se cerrará.

8. Una vez que hayas completado la configuración deseada, puedes usar el contenedor ROS Noetic de acuerdo con tus necesidades.

Esperamos que esta imagen Docker le sea útil para sus proyectos de desarrollo robótico y de visión por computadora. Si tiene alguna pregunta o problemas, no dude en ponerse en contacto con el mantenedor DANIEL OCHOA (<daochoam@unal.edu.co>).
