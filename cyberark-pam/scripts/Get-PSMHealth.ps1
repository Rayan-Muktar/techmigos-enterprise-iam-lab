<#
.SYNOPSIS
  Displays basic CyberArk PSM health information.
#>

Write-Host "=== CyberArk PSM Service Discovery ==="
Get-Service | Where-Object {
    $_.Name -like "*PSM*" -or
    $_.DisplayName -like "*Privileged Session*"
} | Format-Table Name,DisplayName,Status -AutoSize

Write-Host "`n=== PSM / Recorder Processes ==="
Get-Process -ErrorAction SilentlyContinue | Where-Object {
    $_.ProcessName -like "*PSM*" -or
    $_.ProcessName -like "*Recorder*"
} | Select-Object ProcessName,Id,Path

$ComponentLogPath = "C:\Program Files (x86)\CyberArk\PSM\Logs\Components"

Write-Host "`n=== Most Recent Component Logs ==="
if (Test-Path $ComponentLogPath) {
    Get-ChildItem $ComponentLogPath -Recurse -File |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 15 Name,LastWriteTime,Length,FullName
}
else {
    Write-Warning "PSM component log directory was not found at $ComponentLogPath"
}
