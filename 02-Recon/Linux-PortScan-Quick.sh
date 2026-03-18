#!/bin/bash
# 🐞 Titolo: Linux-PortScan-Quick
# Autore: Massimo Vanin @M4xV
# Data: 2026-03-18
# YouTube: https://youtube.com/@massimo-vanin
# Disclaimer: Fornito "as-is". Testare in ambiente sandbox prima del deploy in produzione.

# Parametri
IPRange="192.168.1.0/24" # Modifica con la tua classe di IP
TopPorts="21 22 23 25 80 110 135 139 443 445 3389 8080" # Porte comuni

# Scansione
for ip in $(nmap -sn $IPRange | awk '{print $2}'); do
  for port in $TopPorts; do
    if nc -z -w 1 $ip $port; then
      echo "[$ip]:$port - Aperta"
    fi
  done
done
