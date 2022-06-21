#!/bin/bash

# Bajo placa de red
ifdown enp0s3 

# Elimino configuración red servidor aws de interfaces.d
rm /etc/network/interfaces.d/red_servidor_aws

# Levanto placa de red
ifup enp0s3 

# Borrar usuario profesor
## Lock usuaurio
passwd --lock profesor
## Kill procesos usuario
killall -9 -u profesor
## Borrar usuario profesor y su home
deluser --remove-home profesor

# Borrar ssh-server
sudo apt purge openssh-server
rm -rf /etc/ssh

# Borrar postgresql
sudo apt purge postgresql

# Borrar apache2
sudo apt purge apache2
rm -rf /var/www
