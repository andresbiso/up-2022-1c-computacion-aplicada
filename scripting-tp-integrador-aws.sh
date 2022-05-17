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
