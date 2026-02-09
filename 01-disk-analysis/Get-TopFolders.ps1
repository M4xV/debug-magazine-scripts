# ==============================================================================
# DEBUG MAGAZINE 🐞 | Massimo Vanin (@M4xV) | 09/02/2026
# Link: https://youtube.com/@massimo-vanin
# ⚠️ DISCLAIMER: Uso "as-is". Didattico. Testare in Sandbox. No responsabilità.
#
# 🚀 QUICK LAUNCH (One-Liner): 
# gci $env:USERPROFILE -Dir | % { [PSCustomObject]@{Folder=$_.Name; SizeGB=[Math]::Round(((gci $_.FullName -Rec -File -EA 0 | measure Length -Sum).Sum / 1GB), 2)} } | sort SizeGB -Desc | select -First 5
#
# ==============================================================================
# in questo video: Analisi rapida occupazione disco Home (Top 5)
# ==============================================================================
# ==============================================================================
# 🚀 COME ESEGUIRE SE APPARE "ERRORE DI PROTEZIONE":
# Se Windows blocca lo script, lancia questo comando per sbloccarlo solo per 
# questa sessione (scelta consigliata e sicura):
# powershell.exe -ExecutionPolicy Bypass -File .\Get-TopFolders.ps1
# ==============================================================================

$targetPath = $env:USERPROFILE

Get-ChildItem -Path $targetPath -Directory | ForEach-Object {
    $folderData = Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue | 
                  Measure-Object -Property Length -Sum
    
    [PSCustomObject]@{ 
        Folder = $_.Name 
        SizeGB = [Math]::Round(($folderData.Sum / 1GB), 2) 
    }
} | Sort-Object SizeGB -Descending | Select-Object -First 5
