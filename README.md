# ROS NOETIC - DOCKER
[![Facebook](https://img.shields.io/badge/Facebook-%231877F2.svg?logo=Facebook&logoColor=white)](https://facebook.com/dfom89)   [![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white)](https://instagram.com/ing_daniel8a)   [![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/dfom89)  [![Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?logo=Twitter&logoColor=white)](https://twitter.com/dfom89)   [![Gmail](https://img.shields.io/badge/Gmail-%23E4400F.svg?logo=Gmail&logoColor=white)](https://dfom89@gmail.com)  [![Whatsapp](https://img.shields.io/badge/Whatsapp-%231DA1F2.svg?logo=Whatsapp&logoColor=white)](https://wa.me/573168704626/?text=Hola%20Ingeniero,%20me%20gustaria%20contarte,%20tengo%20un%20proyecto%20que%20te%20puede%20interesar.)    [![Discord](https://img.shields.io/badge/Discord-%237289DA.svg?logo=discord&logoColor=white)](https://discord.gg/dfom89)

https://img.shields.io/github/last-commit/daochoam/VSCode-Github-AWSLambda?color=red&logo=git&style=for-the-badge
https://img.shields.io/github/languages/code-size/daochoam/VSCode-Github-AWSLambda?style=for-the-badge
https://img.shields.io/github/languages/top/daochoam/VSCode-Github-AWSLambda?logo=typescript&logoColor=white&style=for-the-badge
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/daochoam/VSCode-Github-AWSLambda/blob/master/README.md)


### Tecnologías:

<div>
<a href="https://www.linux.org/" target="_blank"><img style="margin: 10px" src="https://raw.githubusercontent.com/daochoam/Data-Bases/main/icons/linux.svg" alt="Linux" height="50" /></a>  
<a href="https://www.python.org/downloads/" target="_blank"><img style="margin: 10px" src="https://raw.githubusercontent.com/daochoam/Data-Bases/main/icons/python3.svg" alt="TypeScript" height="50" /></a>  
<a href="https://www.ros.org/" target="_blank"><img style="margin: 10px" src="https://raw.githubusercontent.com/daochoam/Data-Bases/main/icons/nodejs.svg" alt="Node.js" height="50" /></a>  
</div>

## Instrucciones para ejecutar `install.sh`

Este archivo `install.sh` es un script de shell que facilita la instalación de diferentes configuraciones de ROS Noetic en un entorno de contenedor Docker. A continuación, se describen los pasos para ejecutar el script y las opciones disponibles:

### Requisitos previos
1. Asegúrate de tener Docker instalado en tu sistema. Puedes obtenerlo [aquí](https://docs.docker.com/get-docker/).

### Pasos para ejecutar `install.sh`

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

## Ejecución del Contenedor
Esperamos que esta imagen Docker le sea útil para sus proyectos de desarrollo robótico y de visión por computadora. Si tiene alguna pregunta o problemas, no dude en ponerse en contacto con el mantenedor DANIEL OCHOA (<daochoam@unal.edu.co>).

# Licencia
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>

Este proyecto está bajo la Licencia <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>. Consulta el archivo [LICENSE.md](https://github.com/daochoam/Back-SNKRS/blob/main/LICENSE.md) para más detalles.