#!/bin/bash
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
