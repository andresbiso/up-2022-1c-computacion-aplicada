#!/bin/bash
# Copio configuración red servidor a interfaces.d
cp red_servidor_aws /etc/network/interfaces.d

# Reinicio placa de red
ifdown enp0s3 
ifup enp0s3 
