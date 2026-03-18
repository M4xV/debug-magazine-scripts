# 🐞 Titolo: Linux-PortScan-Interactive

## 🎯 Obiettivi
Script Bash interattivo per la ricognizione rapida delle porte TCP su una subnet `/24`. Richiede in input la classe IP e fornisce un feedback visivo in tempo reale sovrascrivendo la riga corrente del terminale. Sfrutta `/dev/tcp` e `timeout` per abbattere i tempi di scansione a 200ms per porta, senza dipendere da tool esterni come `nmap` o `nc`.

## ⚙️ Prerequisiti
- Ambiente Linux con Bash shell (supporto `/dev/tcp` abilitato).
- Utility `timeout` (inclusa in GNU coreutils standard).

## 🚀 Installazione ed Esecuzione
1. Salvare il file come `Linux-PortScan-Interactive.sh`.
2. Rendere lo script eseguibile:
   ```bash
   chmod +x Linux-PortScan-Interactive.sh

Avviare lo script:
./Linux-PortScan-Interactive.sh
