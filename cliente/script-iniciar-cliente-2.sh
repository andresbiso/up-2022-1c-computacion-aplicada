#!/bin/bash

# Bajo placas de red
ifdown enp0s3
ifdown enp0s8

# Copio configuración red cliente a interfaces.d
cp red_cliente_2 /etc/network/interfaces.d

# Levanto placas de red
ifup enp0s3 
ifup enp0s8
