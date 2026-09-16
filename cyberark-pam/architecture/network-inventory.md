# CyberArk PAM Architecture & Network Inventory

## Logical architecture

```text
                         TECHMIGOS.LOCAL

 +-------------+          +-------------+
 | WORKSTATION | -------> |    PVWA     |
 +-------------+          |  WIN-PVWA   |
                          +------+------+ 
                                 |
                                 v
                          +-------------+
                          |    VAULT    |
                          |  WIN-VAULT  |
                          +------+------+ 
                                 |
                 +---------------+---------------+
                 |                               |
                 v                               v
          +-------------+                 +-------------+
          |     CPM     |                 |     PSM     |
          |   WIN-CPM   |                 |   WIN-PSM   |
          +-------------+                 +------+------+ 
                                                |
                                                | RDP / 3389
                                                v
                                         +-------------+
                                         | APP-SRV01   |
                                         +-------------+
```

## Roles

| System | Purpose |
|---|---|
| WIN-VAULT | Secures CyberArk credential and Safe data |
| WIN-PVWA | Web interface used to administer and request privileged access |
| WIN-CPM | Performs managed credential verification/change/reconciliation workflows |
| WIN-PSM | Brokers and monitors privileged sessions to target systems |
| APP-SRV01 | Windows target protected by the PAM workflow |
| WORKSTATION | User/admin endpoint used to access PVWA |
| Active Directory | Provides `techmigos.local` identities and administrative groups |

## Observed lab addressing

The lab uses the `192.168.46.0/24` network. During testing, the following addresses were observed directly:

| Host / role | Address |
|---|---|
| WIN-VAULT | `192.168.46.141` |
| WIN-PSM | `192.168.46.144` |
| APP-SRV01 | `192.168.46.150` |

Other component addresses should be documented only after they are verified from the VM itself (for example with `ipconfig /all`) rather than guessed.

## Security note

These are RFC1918 private addresses used only in an isolated training lab. No passwords, Vault secrets, private keys, API tokens, or authentication material should be committed to this repository.