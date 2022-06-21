#!/bin/bash

# Bajo placas de red
ifdown enp0s3 
ifdown enp0s8 

# Elimino configuración red servidor aws de interfaces.d
rm /etc/network/interfaces.d/red_servidor_aws

# Levanto placas de red
ifup enp0s3 
ifup enp0s8 

# Borrar usuario profesor
## Lock usuaurio
passwd --lock profesor
## Kill procesos usuario
killall -9 -u profesor
## Borrar usuario profesor y su home
deluser --remove-home profesor

# Borrar ssh-server
sudo apt -y purge openssh-server
rm -rf /etc/ssh

# Borrar postgresql
sudo apt -y purge postgresql

# Borrar apache2
sudo apt -y purge apache2
rm -rf /var/www
