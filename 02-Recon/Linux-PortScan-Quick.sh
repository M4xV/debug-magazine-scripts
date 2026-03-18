#!/bin/bash
# 🐞 Titolo: Linux-PortScan-Interactive
# Autore: Massimo Vanin @M4xV
# Data: 2026-03-18
# YouTube: https://youtube.com/@massimo-vanin
# Disclaimer: Fornito "as-is". Testare in ambiente sandbox prima del deploy in produzione.

# Input interattivo della subnet
read -p "Inserisci i primi 3 ottetti della subnet (es. 10.0.2): " BaseIP
TopPorts="21 22 23 25 80 110 135 139 443 445 3389 8080"

echo -e "\e[36m🚀 Avvio scansione su $BaseIP.1 - $BaseIP.254...\e[0m"

# Generazione IP e Scansione
for i in {1..254}; do
  CurrentIP="$BaseIP.$i"
  
  # UI: Feedback visivo sovrascritto sulla stessa riga (\r)
  echo -ne "Analisi host: $CurrentIP \r"

  for port in $TopPorts; do
    # Utilizzo /dev/tcp nativo di bash con timeout di 0.2 secondi (200ms)
    if timeout 0.2 bash -c "</dev/tcp/$CurrentIP/$port" 2>/dev/null; then
      # \e[K pulisce la riga corrente prima di stampare il risultato per evitare artefatti visivi
      echo -e "\e[K\e[32m[$CurrentIP]:$port - Aperta\e[0m"
    fi
  done
done

# Chiusura UI
echo -e "\e[K\e[36m✅ Scansione completata.\e[0m"
