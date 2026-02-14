Write-Host "--- START WINDOWS AUDIT ---" -ForegroundColor Cyan
Write-Host "DATE: $(Get-Date)"
Write-Host "HOST: $env:COMPUTERNAME"

Write-Host "`n[1] PORTE IN ASCOLTO"
Get-NetTCPConnection -State Listen | Select-Object LocalAddress, LocalPort | Sort-Object LocalPort

Write-Host "`n[2] SESSIONI UTENTE ATTIVE (Chi è loggato ora)"
query user

Write-Host "`n[3] RECENTI CONNESSIONI RDP (Target potenziali)"
Get-ChildItem "HKCU:\Software\Microsoft\Terminal Server Client\Servers" -ErrorAction SilentlyContinue | Select-Object Name

Write-Host "`n[4] CACHE ARP (Host visti in rete)"
arp -a | Select-String "dynamic"

Write-Host "`n[5] TEST CONNESSIONE VERSO SUBNET (Porta 445 SMB)"
# Esempio su una subnet 10.0.0.x
1..254 | ForEach-Object {
    Test-NetConnection -ComputerName "10.0.0.$_" -Port 445 -WarningAction SilentlyContinue | Where-Object {$_.TcpTestSucceeded -eq $true} | Select-Object ComputerName, RemotePort
}
Write-Host "--- END WINDOWS AUDIT ---" -ForegroundColor Cyan
