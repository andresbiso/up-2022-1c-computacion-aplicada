#!/bin/bash

# Bajo placa de red
ifdown enp0s3 

# Elimino configuración red servidor aws de interfaces.d
rm /etc/network/interfaces.d/red_servidor_aws

# Levanto placa de red
ifup enp0s3 
