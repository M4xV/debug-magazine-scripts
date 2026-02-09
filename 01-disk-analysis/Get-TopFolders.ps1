# Get-TopFolders.ps1
# in questo video: Analisi occupazione disco Home Utente (Top 5)

$targetPath = $env:USERPROFILE

Get-ChildItem -Path $targetPath -Directory | ForEach-Object {
    $folderData = Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue | 
                  Measure-Object -Property Length -Sum
    
    [PSCustomObject]@{ 
        Folder = $_.Name 
        SizeGB = [Math]::Round(($folderData.Sum / 1GB), 2) 
    }
} | Sort-Object SizeGB -Descending | Select-Object -First 5
