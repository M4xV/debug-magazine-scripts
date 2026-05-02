# 🐞 Win-Defender-Drive-Scan

Script batch per l'automazione della scansione antivirus su unità specifiche (D:) utilizzando l'ultima versione disponibile del motore Microsoft Defender Platform.

## 📋 Descrizione
Lo script individua dinamicamente il percorso dell'eseguibile `MpCmdRun.exe` all'interno di `C:\ProgramData\Microsoft\Windows Defender\Platform\`, risolvendo il problema delle versioni che cambiano con gli aggiornamenti di sistema.

## 🛠️ Prerequisiti
- Windows 10/11 o Windows Server 2016+
- Privilegi di **Amministratore** (necessari per accedere alla cartella ProgramData e invocare Defender).

## 🚀 Utilizzo
1. Scarica il file `Win-Defender-Drive-Scan.bat`.
2. Fai clic destro sul file e seleziona **Esegui come amministratore**.
3. Lo script eseguirà una scansione di tipo 3 (Custom Scan) sull'unità `D:`.

## ⚠️ Disclaimer
Fornito "as-is". L'autore non si assume responsabilità per usi impropri o danni derivanti dall'esecuzione dello script.
