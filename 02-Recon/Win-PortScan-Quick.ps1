# 🐞 Titolo: Win-PortScan-Quick
# Autore: Massimo Vanin @M4xV
# Data: 2026-03-18
# YouTube: https://youtube.com/@massimo-vanin
# Disclaimer: Fornito "as-is". Testare in ambiente sandbox prima del deploy in produzione.

# Parametri
$IPRange = "192.168.1.0/24" # Modifica con la tua classe di IP
$TopPorts = @(21, 22, 23, 25, 80, 110, 135, 139, 443, 445, 3389, 8080) # Porte comuni

# Funzione per testare la connessione
function Test-Port {
  param (
    [string]$IP,
    [int]$Port
  )
  try {
    $tcpClient = New-Object System.Net.Sockets.TcpClient
    $tcpClient.Connect($IP, $Port)
    Write-Host "[$IP]:$Port - Aperta" -ForegroundColor Green
    $tcpClient.Close()
  }
  catch {
    #Write-Host "[$IP]:$Port - Chiusa" -ForegroundColor Red #Commentato per ridurre il rumore
  }
}

# Scansione
foreach ($IP in (Test-NetConnection -ComputerName $IPRange -InformationLevel Block | Select-Object -ExpandProperty IPAddress)) {
  foreach ($Port in $TopPorts) {
    Test-Port -IP $IP -Port $Port
  }
}
