# 🐞 Titolo: Win-PortScan-Subnet
# Autore: Massimo Vanin @M4xV
# Data: 2026-03-18
# YouTube: https://youtube.com/@massimo-vanin
# Disclaimer: Fornito "as-is". Testare in ambiente sandbox prima del deploy in produzione.

# Parametri
$BaseIP = "10.0.2" # Inserisci i primi 3 ottetti della tua subnet
$TopPorts = @(21, 22, 23, 25, 80, 110, 135, 139, 443, 445, 3389, 8080)

# Funzione per testare la connessione con Timeout (Asincrono)
function Test-Port {
  param (
    [string]$IP,
    [int]$Port
  )
  try {
    $tcpClient = New-Object System.Net.Sockets.TcpClient
    $asyncResult = $tcpClient.BeginConnect($IP, $Port, $null, $null)
    
    # Timeout di 200ms per velocizzare il drop sui pacchetti persi
    $success = $asyncResult.AsyncWaitHandle.WaitOne(200, $false) 
    
    if ($success) {
        $tcpClient.EndConnect($asyncResult)
        Write-Host "[$IP]:$Port - Aperta" -ForegroundColor Green
    }
    $tcpClient.Close()
  }
  catch {
    # Ignora errori per mantenere l'output pulito
  }
}

Write-Host "🚀 Avvio scansione su $BaseIP.1 - $BaseIP.254..." -ForegroundColor Cyan

# Generazione IP e Scansione
foreach ($i in 1..254) {
  $CurrentIP = "$BaseIP.$i"
  foreach ($Port in $TopPorts) {
    Test-Port -IP $CurrentIP -Port $Port
  }
}

Write-Host "✅ Scansione completata." -ForegroundColor Cyan
