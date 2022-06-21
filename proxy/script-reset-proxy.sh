#!/bin/bash

# Bajo placa de red
ifdown enp0s3 

# Elimino configuración red proxy de interfaces.d
rm /etc/network/interfaces.d/red_proxy

# Levanto placa de red
ifup enp0s3 

# Elimino archivos de configuración de cron de la home del root
rm /root/dia_laboral.cfg
rm /root/dia_no_laboral.cfg

# Elimino configuración crontab de root
rm /var/spool/cron/crontabs/root

# Reinicio crond
systemctl restart cron.service
