# Descargar la imagen base de Ubuntu
FROM ubuntu:22.04

# Configurar la zona horaria automáticamente
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    apt-get update --fix-missing && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Actualizar la imagen
RUN apt-get upgrade -y

# Instalar PHP y Apache
RUN apt-get install php libapache2-mod-php -y

# Instalar Apache
RUN apt-get install apache2 -y

# Copiar la carpeta con la aplicación
COPY ./webapp /var/www/html/

# Establecer el directorio de trabajo
WORKDIR /var/www/html/

# Exponer el puerto 80 para HTTP
EXPOSE 80

# Iniciar el servidor Apache
CMD ["apachectl", "-D", "FOREGROUND"]
