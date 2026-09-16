# Troubleshooting Case Study: PSM Recorder Failure

## Symptom

A PSM-RDP session terminated with the message:

```text
Session component [Recorder] has stopped unexpectedly.
Ending session.
```

An earlier attempt also reported that the user's request to connect through PSM had expired. After reinitiating the request, troubleshooting moved to the Recorder failure.

## 1. Verify the PSM service

The Windows service was identified using PowerShell rather than assuming its internal service name:

```powershell
Get-Service | Where-Object {
    $_.Name -like "*PSM*" -or
    $_.DisplayName -like "*Privileged Session*"
} | Format-Table Name,DisplayName,Status -AutoSize
```

Observed result:

```text
Cyber-Ark Privileged Session Manager    Running
```

The service was therefore installed and running.

## 2. Verify the PSM process

```powershell
Get-Process | Where-Object {
    $_.ProcessName -like "*PSM*" -or
    $_.ProcessName -like "*Recorder*"
} | Select ProcessName,Id,Path
```

`CAPSM.exe` was observed under:

```text
C:\Program Files (x86)\CyberArk\PSM\CAPSM.exe
```

## 3. Locate component logs

```powershell
Get-ChildItem "C:\Program Files (x86)\CyberArk\PSM\Logs\Components" `
  -Recurse -File |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 15 Name,LastWriteTime,Length,FullName
```

Recent `.RDP.log` and `.Recorder.log` files were found for the failed session.

## 4. Recorder log evidence

The Recorder log reported failures including:

```text
PSMRC058 Failed to start encode SCPR
PSMRC057 Failed to open SCPR
PSM Recorder ended with errors
```

This provided direct evidence that the session was terminating inside the Recorder path rather than simply failing because the CyberArk PSM Windows service was stopped.

## 5. RDP component log evidence

The RDP log also reported configuration-related messages involving:

```text
EnableCredSSPSupport
```

The property was reported as not found in the relevant password/client specification maps.

## Troubleshooting conclusion

At this point the evidence supports a narrower diagnosis:

- Core PSM service: running
- `CAPSM.exe`: running
- Target privileged login: previously demonstrated successfully
- Failure point: PSM session Recorder/component path
- Additional configuration clue: `EnableCredSSPSupport` property lookup errors

The correct next step is to validate the PSM-RDP connection-component/Recorder configuration and relevant PSM logs before making broad changes to Vault, Safe, or target account permissions.

## Engineering lesson

The useful skill demonstrated here is fault isolation. A generic "PSM connection failed" can originate from network reachability, target authorization, Vault authorization, an expired request, a connection component, or the Recorder. Inspecting the session-specific component logs narrowed the problem to the appropriate layer.