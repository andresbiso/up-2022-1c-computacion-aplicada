#!/bin/bash

# Bajo placa de red
ifdown enp0s3 

# Elimino configuración red cliente de interfaces.d
rm /etc/network/interfaces.d/red_cliente_2

# Levanto placa de red
ifup enp0s3 
