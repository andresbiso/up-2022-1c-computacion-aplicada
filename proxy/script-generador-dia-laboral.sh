#!/bin/bash
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

iptables-save > dia_laboral.cfg

# Dia No Laboral
iptables -I INPUT -s 192.168.1.10 -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -s 192.168.1.10 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.10/32 -d 0.0.0.0/0 -j MASQUERADE
iptables -A FORWARD -s 192.168.1.10/32 -d 0.0.0.0/0 -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -d 192.168.1.55/32 -s 0.0.0.0/0 -i enp0s3 -o enp0s8 -j ACCEPT
