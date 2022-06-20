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
sudo apt-get -y install apache2

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
<p>Esta materia fue mi primer contacto con la consola de Linux. Me gusto la forma practica como se dieron los conceptos y herramientas</p>
<h3>Diego Anastasio</h3>
<p>La materia nos ha enseñado conceptos muy utiles e interesantes para aprender a entender como funciona una computadora y su sistema en profundidad. Una oportunidad para los recien iniciados en lenguajes de scripting.</p>
<h3>Ignacio Goitea</h3>
<p>Me gustó mucho la materia, pude aprender conceptos sencillos pero versátiles que Linux trae de manera nativa y que son muy útiles.</p>
</body>
</html>' > trabajo.html 

cp index.html /var/www/html/index.html

sudo apt-get -y install postgresql

# Restart Apache
echo -e "$Cyan \n Restarting Apache $Color_Off"
sudo systemctl restart apache2

# Restart Postgresql
echo -e "$Cyan \n Restarting Postgresql $Color_Off"
sudo systemctl restart postgresql

# Crear usuario Profesor
sudo useradd profesor -d /home/profesor -m
sudo echo -e "1111111\n1111111" | sudo passwd profesor 
echo "se ha creado el usuario 'profesor' con éxito"

# Configuro SSH
sudo apt-get -y install openssh-server
echo "AllowUsers profesor" >> /etc/ssh/sshd_config
sudo systemctl restart sshd 

# Agrego symlinks y hardlinks
ln -s /var/www/html /home/profesor/html
ln ./scripting-tp-integrador.sh /home/profesor/script.sh

# Script Alias User Profesor
echo "alias probar_script='/home/profesor/script.sh'" >> /home/profesor/.bashrc
