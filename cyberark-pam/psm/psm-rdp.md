# PSM-RDP Configuration and Validation

## Purpose

CyberArk Privileged Session Manager (PSM) is used as the controlled hop between the user and the target Windows server. The managed credential remains under CyberArk control while the user receives an RDP session through PSM.

## Platform configuration

The Windows Domain Account platform contains an enabled connection component:

```text
PSM-RDP
Enable: Yes
```

Other RDP-related connection components were present, but `PSM-RDP` was selected for this workflow.

## Session workflow

```text
mchen -> PVWA -> Vault/authorization -> WIN-PSM -> APP-SRV01
                                      PSM-RDP       RDP 3389
```

The managed account in the Safe is `adm-mchen@techmigos.local`.

## Network validation

An ICMP ping from PSM to `APP-SRV01` timed out. That alone did not prove the RDP path was unavailable because Windows Firewall can block ICMP while allowing TCP 3389.

The more relevant test was:

```powershell
Test-NetConnection APP-SRV01 -Port 3389
```

The target resolved to `192.168.46.150`, while the PSM source address was observed as `192.168.46.144`.

This illustrates an important troubleshooting rule: test the application port required by the PAM connection rather than relying solely on ping.

## Target authorization validation

On `APP-SRV01`, local group membership was checked with:

```powershell
Get-LocalGroupMember "Remote Desktop Users"
Get-LocalGroupMember "Administrators"
```

The Administrators group contained the domain group:

```text
TECHMIGOS\PAM-Server-Admins
```

The AD PowerShell module was installed when `Get-ADGroupMember` was initially unavailable:

```powershell
Install-WindowsFeature RSAT-AD-PowerShell
Import-Module ActiveDirectory
Get-ADGroupMember "PAM-Server-Admins" | Select Name,SamAccountName
```

This confirmed `adm-mchen` was authorized through the domain group.

## Result

A privileged login through PSM was successfully established during testing. A later session ended because the Recorder component stopped unexpectedly; that failure is documented separately because it represents a PSM component issue rather than simply a target-account authorization problem.