#!/bin/bash

# Bajo placas de red
ifdown enp0s3 
ifdown enp0s8

# Elimino configuración red cliente de interfaces.d
rm /etc/network/interfaces.d/red_cliente

# Levanto placas de red
ifup enp0s3 
ifup enp0s8
