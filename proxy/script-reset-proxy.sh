#!/bin/bash

# Bajo placas de red
ifdown enp0s3 
ifdown enp0s8

# Elimino configuración red proxy de interfaces.d
rm /etc/network/interfaces.d/red_proxy

# Levanto placas de red
ifup enp0s3 
ifup enp0s8

# Elimino archivos de configuración de cron de la home del root
rm /root/dia_laboral.cfg
rm /root/dia_no_laboral.cfg

# Elimino configuración crontab de root
rm /var/spool/cron/crontabs/root

# Reinicio crond
systemctl restart cron.service
