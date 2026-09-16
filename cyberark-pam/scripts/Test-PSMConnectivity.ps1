<#
.SYNOPSIS
  Basic connectivity diagnostics for the TechMigos CyberArk PSM lab.
.DESCRIPTION
  Tests DNS resolution and TCP/3389 reachability from the system on which
  the script is executed. No credentials or secrets are collected.
#>

param(
    [string]$Target = "APP-SRV01",
    [int]$Port = 3389
)

Write-Host "=== TechMigos PSM Connectivity Test ==="
Write-Host "Target: $Target"
Write-Host "Port:   $Port"

Write-Host "`n[1] DNS resolution"
try {
    Resolve-DnsName $Target -ErrorAction Stop |
        Select-Object Name,IPAddress,Type
}
catch {
    Write-Warning "DNS resolution failed: $($_.Exception.Message)"
}

Write-Host "`n[2] ICMP test (informational only)"
Test-Connection $Target -Count 2 -ErrorAction SilentlyContinue

Write-Host "`n[3] Required RDP port test"
Test-NetConnection $Target -Port $Port |
    Select-Object ComputerName,RemoteAddress,RemotePort,SourceAddress,TcpTestSucceeded

Write-Host "`nRemember: ping failure does not automatically mean RDP is unavailable."
