#!/bin/bash

# Reset General de Iptables

# Vuelvo a aceptar todo el tráfico
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
 
# Flush de todas las cadenas y reglas
iptables -F
 
# Borrar todas las cadenas
iptables -X
 
# Flush de todos los contadores
iptables -Z 

# Aplico mismo cambios para el resto de las tablas de iptables
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t raw -F
iptables -t raw -X

# Reglas Base

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Dia No Laboral
iptables -I INPUT -s 192.168.1.10 -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -d 192.168.1.10 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.10/32 -d 0.0.0.0/0 -j MASQUERADE
iptables -A FORWARD -s 192.168.1.10/32 -d 0.0.0.0/0 -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -d 192.168.1.55/32 -s 0.0.0.0/0 -i enp0s3 -o enp0s8 -j ACCEPT

iptables-save > dia_no_laboral.cfg
