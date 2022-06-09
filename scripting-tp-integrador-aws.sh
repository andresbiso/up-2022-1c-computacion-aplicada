#|/bin/bash

####
# El siguiente script estaba destinado a correr en AWS pero dado a que durante este cuatrimestre 
# no pudimos tener acceso al mismo, se lo adaptó para que funcione en las VM de Virtual Box
# corriendo Debian GNU/Linux 11
###

# Colores
# Reset
Color_Off='\033[0m' # Text Reset

# Colores Normales
Red='\033[o;31m' # Rojo
Green='\033[o;32m' # Verde
Yellow='\033[o;33m' # Amarillo
Purple='\033[0;35m' # Morado
Cyan='\033[0;36m' # Cian

# Actualizar lista de paquetes y actualizar el sistema
echo -e "$Cyan \n Actualizando Sistema... $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

# Instalar Apache
echo -e "$Cyan \n Instalando Apache2 $Color_Off"
sudo apt-get install apache2

# Cambio los permisos de la carpeta para poder crear archivo html 
sudo chown -hR linux:linux /var/www
sudo chmod -R g+rw /var/www

# Iniciar Apache
sudo systemctl start apache2
sudo systemctl status apache2

# Crear pagina ejemplo
cd /var/www/html
touch trabajo.html
echo '<!DOCTYPE html>
<html>
<head>
<title>Computación Aplicada</title>
<meta charset="UTF-8">
</head>
<body>
<h1>Opiniones Personales</h1>
<h3>Andrés Biso</h3>
<p>Desde mi punto de vista la materia permite que aprendamos un montón de herramientas que nos sirven en el día a día a los que trabajamos en el área de sistemas.</p>
<h3>Lautaro Barceló</h3>
<p>En un universo tan visual, siempre me intimidó la terminal vacía sobre fondo negro. El curso logró que pueda manejarme con cierta fluidez en Linux, además de ayudarme a comprender los procesos y aplicaciones que se pueden llevar a cabo. </p>
<h3>Leonardo Boella</h3>
<p>Esta materia fue mi primer entrada al mundo Linux. A modo que pequeña critica, me parece que arranco lento y sobre el final se acumularon muchos contenidos</p>
</body>
</html>' > trabajo.html 

# Restart Apache
echo -e "$Cyan \n Restarting Apache $Color_Off"
sudo service apache2 restart
