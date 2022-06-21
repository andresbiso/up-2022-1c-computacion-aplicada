#|/bin/bash

####
# El siguiente script estaba destinado a correr en AWS pero dado a que durante este cuatrimestre 
# no pudimos tener acceso al mismo, se lo adaptó para que funcione en las VM de Virtual Box
# corriendo Debian GNU/Linux 11
###

# Sesión no interactiva
DEBIAN_FRONTEND=noninteractive

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
echo -e "$Cyan \n Cambiando permisos de /var/www $Color_Off"
sudo chown -hR linux:linux /var/www
sudo chmod -R g+rw /var/www

# Crear pagina ejemplo
echo -e "$Cyan \n Creando página de ejemplo $Color_Off"
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
</html>' > /var/www/html/trabajo.html 

echo -e "$Cyan \n Creando homepage $Color_Off"
echo '
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Página Principal</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Página Principal">
</head>
<body>
  <header>
    <h1>¡Bienvenido!</h1>
  </header>

  <section>
    <h2>Página Principal</h2>
    <li><a href="trabajo.html">Ir a trabajo.html</a></li>
  </section>

</body>
</html>' > /var/www/html/index.html

echo -e "$Cyan \n Instalando postgresql $Color_Off"
sudo apt-get -y install postgresql

# Restart Apache
echo -e "$Cyan \n Restarting Apache $Color_Off"
sudo systemctl restart apache2

# Restart Postgresql
echo -e "$Cyan \n Restarting Postgresql $Color_Off"
sudo systemctl restart postgresql

# Crear usuario Profesor
echo -e "$Cyan \n Creando usuario profesor $Color_Off"
sudo useradd profesor -s /bin/bash -d /home/profesor -m
sudo echo -e "1111111\n1111111" | sudo passwd profesor 
echo -e "$Cyan \n Se ha creado el usuario profesor con éxito $Color_Off"

# Configuro SSH
echo -e "$Cyan \n Instalando y configurando ssh $Color_Off"
sudo apt-get -y install openssh-server
echo "AllowUsers linux profesor" >> /etc/ssh/sshd_config
sudo systemctl restart ssh.service 

# Agrego symlinks y hardlinks
echo -e "$Cyan \n Creando symlink y hardlinks para usuario profesor $Color_Off"
ln -sf /var/www/html /home/profesor/html
ln -f scripting-tp-integrador.sh /home/profesor/script.sh

# Script Alias User Profesor
echo -e "$Cyan \n Creando bash alias para usuario profesor $Color_Off"
echo "alias probar_script='/home/profesor/script.sh'" >> /home/profesor/.bashrc
