#!/bin/bash
cd /etc/network/interfaces.d/
touch proxy_red
echo "auto enp0s8" >> proxy_red 
echo "iface enp0s8 inet static" >> proxy_red
echo "address 192.168.1.55" >> proxy_red
echo "netmask 255.255.255.0" >> proxy_red
echo "gateway 192.168.1.1" >> proxy_red

ifdown enp0s8
ifup enp0s8

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Dia Laboral
iptables -A INPUT -s 192.168.1.55 -j DROP
iptables -I INPUT -s 192.168.1.55 -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -s 192.168.1.55 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 5432 -m iprange --src-range 192.168.1.0-192.168.1.255 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m iprange --src-range 192.168.1.0-192.168.1.255 -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -i enp0s3 -o enp0s8 -j ACCEPT  

# Dia No Laboral
iptables -I INPUT -s 192.168.1.10 -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -s 192.168.1.10 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.10/32 -d 0.0.0.0/0 -j MASQUERADE
iptables -A FORWARD -s 192.168.1.10/32 -d 0.0.0.0/0 -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -d 192.168.1.55/32 -s 0.0.0.0/0 -i enp0s3 -o enp0s8 -j ACCEPT

alias probar_script=scripting-tp-integrador.sh
