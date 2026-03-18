# 🐞 Titolo: Win-PortScan-Subnet

## 🎯 Obiettivi
Script PowerShell per la ricognizione rapida delle porte TCP aperte su un'intera subnet `/24`. Sostituisce `Test-NetConnection` con socket TCP 
asincroni per bypassare i limiti di risoluzione DNS e abbattere drasticamente i tempi di esecuzione tramite un timeout custom (200ms).

## ⚙️ Prerequisiti
- Windows PowerShell 5.1 o superiore.
- Nessun modulo esterno richiesto (sfrutta `System.Net.Sockets.TcpClient` nativo del .NET Framework).

## 🚀 Installazione ed Esecuzione
1. Salvare il file come `Win-PortScan-Subnet.ps1`.
2. Modificare la variabile `$BaseIP` con i primi 3 ottetti della rete target (es. `10.0.2`).
3. Eseguire da terminale bypassando le policy di restrizione:
   ```cmd
   powershell.exe -ExecutionPolicy Bypass -File .\Win-PortScan-Subnet.ps1
