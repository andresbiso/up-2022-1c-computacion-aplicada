#!/bin/bash

# Bajo placas de red
ifdown enp0s3
ifdown enp0s8

# Copio configuración red proxy a interfaces.d
cp red_proxy /etc/network/interfaces.d

# Levanto placas de red
ifup enp0s3 
ifup enp0s8

# Copio archivos de configuración a home del root
cp dia_laboral.cfg /root
cp dia_no_laboral.cfg /root

# Copio configuración cron a crontab root
cp crontab_proxy /var/spool/cron/crontabs/root

# Reinicio crond
systemctl restart cron.service
