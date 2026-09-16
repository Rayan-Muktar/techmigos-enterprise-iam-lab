# TechMigos CyberArk PAM Lab

This section documents the CyberArk Privileged Access Management environment built for the TechMigos enterprise IAM lab.

## Objective

Extend the identity lab beyond workforce SSO into privileged access management by protecting administrative Windows credentials and routing privileged sessions through CyberArk PSM.

## Lab components

- CyberArk Digital Vault (`WIN-VAULT`)
- Password Vault Web Access / PVWA (`WIN-PVWA`)
- Central Policy Manager / CPM (`WIN-CPM`)
- Privileged Session Manager / PSM (`WIN-PSM`)
- Active Directory (`techmigos.local`)
- Protected application server (`APP-SRV01`)
- Administrative workstation (`WORKSTATION`)

## Implemented workflow

1. Created the `TECHMIGOS-Windows-Admins` Safe.
2. Onboarded the privileged domain account `adm-mchen` using the Windows Domain Account platform (`WinDomain`).
3. Added the appropriate Safe member and applied least-privilege connection permissions.
4. Configured the Windows platform with the `PSM-RDP` connection component.
5. Verified the CyberArk Privileged Session Manager service on `WIN-PSM`.
6. Verified the target administrator authorization through the `PAM-Server-Admins` Active Directory group.
7. Tested network/RDP connectivity between PSM and `APP-SRV01`.
8. Successfully initiated a privileged PSM login to the protected server.
9. Investigated subsequent PSM Recorder/session termination errors through component logs.

## Privileged session path

```text
User / WORKSTATION
       |
       v
     PVWA
       |
       v
CyberArk Vault ---- CPM
       |
       v
      PSM
       |
       | RDP 3389
       v
   APP-SRV01
```

The user initiates access from PVWA. CyberArk controls the privileged credential while PSM brokers the RDP session to the target server. This reduces the need to expose the managed password directly to the end user and provides a control point for privileged-session monitoring.

## Current lab evidence

The lab demonstrated that the core PSM path can reach the target and establish a privileged login. Troubleshooting later identified a session recorder failure rather than treating every failed connection as a basic RDP/network failure.

See the supporting documentation in this directory for Safe design, PSM testing, PowerShell diagnostics, and the recorder investigation.

> This is a personal training environment. Hostnames, accounts, addressing, and configuration examples are lab-only and are not production credentials.