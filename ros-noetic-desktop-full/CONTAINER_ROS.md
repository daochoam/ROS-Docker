## Descripción General del Script

El script Bash está diseñado para simplificar el proceso de configurar un entorno de Docker para el desarrollo de ROS. Ofrece la flexibilidad de especificar un directorio para el intercambio de datos entre el sistema anfitrión y el contenedor de Docker. A continuación, se presenta un desglose paso a paso de la funcionalidad del script:

1. **Verificación de Permisos:**
   - El script comienza con una comprobación de permisos para ver si se está ejecutando como usuario root (con `sudo`) o como un usuario regular.

2. **Selección del Directorio Predeterminado:**
   - Según el nivel de permisos del usuario, se determina el directorio predeterminado para el intercambio de datos:
     - Si no se está ejecutando con `sudo`, el directorio predeterminado se establece en `Docker/ROS/`.
     - Si se está ejecutando con `sudo`, el directorio predeterminado se establece en `home/Docker/ROS` (nota que falta una barra `/` al principio, lo cual podría ser un error tipográfico, y debería ser `/home/Docker/ROS` para especificar el directorio de inicio del usuario).

3. **Solicitud de Entrada de Directorio:**
   - Si el usuario no proporciona un directorio como argumento al ejecutar el script, se le solicita al usuario que ingrese un directorio para el intercambio de datos.
   - Si el usuario presiona Enter sin proporcionar un directorio, se utiliza el directorio predeterminado determinado en el paso anterior.
   - Si el usuario proporciona un directorio, se utiliza esa entrada como el directorio de intercambio de datos.

4. **Creación del Directorio de Intercambio de Datos:**
   - El script combina el directorio proporcionado o predeterminado con el directorio de inicio del usuario para crear una ruta absoluta para el directorio de intercambio de datos.
   - Luego, utiliza `mkdir -p` para crear el directorio especificado (y sus directorios principales si no existen).

5. **Ruta del Archivo .Xauthority:**
   - El script calcula la ruta absoluta del archivo `.Xauthority` utilizando el comando `realpath`, y se almacena en la variable `XAUTHORITY_ABSOLUTE`.

6. **Configuración del Contenedor de Docker:**
   - El script inicia un contenedor de Docker con la siguiente configuración:
     - `--privileged`: Concede privilegios extendidos al contenedor, lo que puede ser necesario para ciertas operaciones.
     - `--name=ros-noetic`: Asigna el nombre "ros-noetic" al contenedor para facilitar su referencia.
     - `--net=host`: Comparte el espacio de nombres de red con el sistema anfitrión, permitiendo una conectividad de red sin problemas.
     - Las opciones `--publish` exponen los puertos del contenedor para interfaces web, lo que permite acceder a aplicaciones web.
     - Se establecen variables de entorno para habilitar el intercambio de la pantalla X11, garantizando que las aplicaciones gráficas dentro del contenedor se muestren en el sistema anfitrión.
     - Se habilita el soporte de GPU NVIDIA con variables de entorno específicas.
     - Se montan varios volúmenes para habilitar el intercambio de datos:
       - `/tmp/.X11-unix`: Monta el socket X11 para compartir la pantalla gráfica.
       - Archivo Xauthority: Monta el archivo `.Xauthority` para fines de autenticación.
       - `/tmp/.docker.xauth`: Monta el archivo Xauthority de Docker.
       - El directorio de intercambio de datos especificado por el usuario: Monta el directorio especificado por el usuario, lo que permite compartir datos entre el sistema anfitrión y el contenedor.

7. **Información sobre el Directorio de Intercambio de Datos:**
   - Después de que se inicie el contenedor, el script imprime un mensaje que indica el directorio de intercambio de datos que se utilizó.

## Uso

Para utilizar este script, sigue los pasos mencionados en el README proporcionado. Ejecuta el script con `sudo` si es necesario y especifica un directorio para el intercambio de datos si es necesario. Luego, el script configurará un contenedor de Docker con ROS y el directorio de intercambio de datos especificado.

Personaliza el script y la configuración del contenedor de Docker según tus necesidades específicas de desarrollo de ROS.