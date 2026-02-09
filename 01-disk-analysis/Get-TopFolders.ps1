# ==============================================================================
# DEBUG MAGAZINE 🐞 | Massimo Vanin (@M4xV) | 09/02/2026
# Link: https://youtube.com/@massimo-vanin
# ⚠️ DISCLAIMER: Uso "as-is". Didattico. Testare in Sandbox. No responsabilità.
# ==============================================================================
# in questo video: Analisi rapida occupazione disco Home (Top 5)
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
