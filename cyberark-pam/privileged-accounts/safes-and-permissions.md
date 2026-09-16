# Safe Design and Privileged Account Onboarding

## Safe

The lab uses a dedicated CyberArk Safe named:

`TECHMIGOS-Windows-Admins`

The Safe separates privileged Windows administrative credentials from other PAM objects and provides a boundary for membership and permissions.

## Managed account

| Property | Lab value |
|---|---|
| Username | `adm-mchen` |
| Domain/address | `techmigos.local` |
| Platform ID | `WinDomain` |
| Safe | `TECHMIGOS-Windows-Admins` |

## Safe membership

The domain user `mchen` was added as a Safe member from the `TECHMIGOS` directory source.

For normal privileged-session use, the lab used a connection-focused permission model rather than granting full Safe administration. Relevant access capabilities include:

- List accounts
- Use accounts

Password retrieval should remain disabled unless the use case specifically requires revealing/copying the managed secret. This demonstrates the PAM principle of allowing a user to **use** a privileged credential without necessarily knowing it.

## Active Directory authorization

The protected Windows server contains the Active Directory group:

`TECHMIGOS\PAM-Server-Admins`

The privileged identity `adm-mchen` was verified as a member using:

```powershell
Get-ADGroupMember "PAM-Server-Admins" | Select-Object Name,SamAccountName
```

Example lab result:

```text
Name                SamAccountName
----                --------------
Michael Chen Admin  adm-mchen
```

The target server's local Administrators group also included `TECHMIGOS\PAM-Server-Admins`, allowing group-based administrative authorization instead of manually assigning the domain user on each server.

## Design lesson

CyberArk Safe authorization and Windows target authorization are separate controls. A user may be allowed to initiate/use an account in CyberArk, while the managed account must independently possess the required rights on the destination system.