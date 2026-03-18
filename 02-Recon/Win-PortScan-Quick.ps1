# 🐞 Titolo: Win-PortScan-Interactive
# Autore: Massimo Vanin @M4xV
# Data: 2026-03-18
# YouTube: https://youtube.com/@massimo-vanin
# Disclaimer: Fornito "as-is". Testare in ambiente sandbox prima del deploy in produzione.

# Input interattivo della subnet
$BaseIP = Read-Host "Inserisci i primi 3 ottetti della subnet (es. 10.0.2)"
$TopPorts = @(21, 22, 23, 25, 80, 110, 135, 139, 443, 445, 3389, 8080)

Write-Host "🚀 Avvio scansione su $BaseIP.1 - $BaseIP.254..." -ForegroundColor Cyan

# Generazione IP e Scansione
foreach ($i in 1..254) {
  $CurrentIP = "$BaseIP.$i"
  
  # UI: Barra di avanzamento e host corrente
  Write-Progress -Activity "Scanner Subnet /24" -Status "Analisi host: $CurrentIP" -PercentComplete (($i / 254) * 100)

  foreach ($Port in $TopPorts) {
    try {
      $tcpClient = New-Object System.Net.Sockets.TcpClient
      $asyncResult = $tcpClient.BeginConnect($CurrentIP, $Port, $null, $null)
      
      # Timeout di 200ms
      $success = $asyncResult.AsyncWaitHandle.WaitOne(200, $false) 
      
      if ($success) {
          $tcpClient.EndConnect($asyncResult)
          Write-Host "[$CurrentIP]:$Port - Aperta" -ForegroundColor Green
      }
      $tcpClient.Close()
    }
    catch {
      # Drop silenzioso degli errori
    }
  }
}

# Chiusura UI progress bar
Write-Progress -Activity "Scanner Subnet /24" -Completed
Write-Host "✅ Scansione completata." -ForegroundColor Cyan
