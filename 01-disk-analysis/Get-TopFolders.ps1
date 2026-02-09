# Get-TopFolders.ps1
# in questo video: Analisi occupazione disco Home Utente (Top 5)

# ==============================================================================
# Script: Get-TopFolders.ps1
# Autore: Massimo Vanin (@M4xV) - Debug Magazine
# Data: 9 Febbraio 2026, 12:00
# Descrizione: Analisi top 5 cartelle per dimensione (Home Utente)
# YouTube: https://youtube.com/@massimo-vanin
# ==============================================================================
# in questo video: Analisi occupazione disco rapida per sistemi Windows/Linux
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
