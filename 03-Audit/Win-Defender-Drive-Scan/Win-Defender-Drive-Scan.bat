@echo off
:: 🐞 Titolo: Win-Defender-Drive-Scan
:: Autore: Massimo Vanin @M4xV
:: Data: 2026-05-02
:: YouTube: https://youtube.com/@massimo-vanin
:: Disclaimer: Questo script è fornito "as-is" senza garanzie. Testare prima dell'uso.

:: Cerca la cartella più recente nella directory Platform
for /d %%i in ("C:\ProgramData\Microsoft\Windows Defender\Platform\4.18*") do (
    set "LatestDefender=%%i\MpCmdRun.exe"
)

echo [DEBUG] Esecutore trovato in: %LatestDefender%

:: Esegue la scansione su D:
if exist "%LatestDefender%" (
    "%LatestDefender%" -Scan -ScanType 3 -File D:\
) else (
    echo [ERROR] MpCmdRun.exe non trovato. Verifica i permessi.
)

pause
