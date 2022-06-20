#!/bin/bash
# Copio configuración red proxy a interfaces.d
mv red_proxy /etc/network/interfaces.d
# Copio archivos de configuración a home del root
mv dia_laboral.cfg /root
mv dia_no_laboral.cfg /root
# Copio configuración cron a crontab root
mv crontab_proxy /var/spool/cron/crontabs/root
