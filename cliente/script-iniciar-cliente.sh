#!/bin/bash
# Copio configuración red cliente a interfaces.d
cp red_cliente /etc/network/interfaces.d

# Reinicio placa de red
ifdown enp0s3 
ifup enp0s3 
