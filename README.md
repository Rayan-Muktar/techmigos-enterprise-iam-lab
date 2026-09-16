# TechMigos Enterprise IAM & PAM Lab

An enterprise-style identity and privileged-access portfolio built around workforce IAM, federation, lifecycle automation, Active Directory, and CyberArk Privileged Access Management.

## Projects Index

The IAM portion is built as six sequential, interconnected projects — each documents a phase of standing up an enterprise identity environment and builds on the attributes, groups, and policies established before it.

| # | Project | What it demonstrates | Key skills |
|---|---------|----------------------|------------|
| 01 | [Okta Organization Setup](./projects/01-okta-organization-setup) | Deploying and configuring an Okta Identity Engine tenant from scratch | Tenant configuration, admin role delegation, group design |
| 02 | [Profile Editor & Attribute Mapping](./projects/02-profile-editor-and-attribute-mapping) | Bidirectional attribute sync between Okta and connected apps | Universal Directory, OEL, source-of-truth design |
| 03 | [User Lifecycle](./projects/03-user-lifecycle) | Automated, attribute-driven group assignment (JML) | Group rules, provisioning, lifecycle automation |
| 04 | [SAML — Salesforce](./projects/04-saml-salesforce) | Federated SSO with real troubleshooting included | SAML 2.0, IdP/SP trust, certificate exchange |
| 05 | [SAML — Zendesk](./projects/05-saml-zendesk) | A second SAML integration, reinforcing the pattern | SAML 2.0, multi-app federation |
| 06 | [Security Policies](./projects/06-security-policies) | Authentication and access policy design | MFA, session policy, adaptive access |
| 07 | [CyberArk Privileged Access Management](./cyberark-pam) | Protecting Windows privileged accounts and brokering administrative RDP sessions through PSM | CyberArk Vault, PVWA, CPM, PSM, Safes, PSM-RDP, AD, PowerShell troubleshooting |

## CyberArk PAM extension

The CyberArk portion extends the lab from workforce identity into privileged identity security. It includes a dedicated Windows administrator Safe, privileged domain-account onboarding, Active Directory group-based target authorization, PSM-RDP, PSM service/port validation, and a real troubleshooting case involving the PSM Recorder.

Start here: **[TechMigos CyberArk PAM Lab](./cyberark-pam/README.md)**

### Tech stack

`Okta Identity Engine` · `CyberArk PAM` · `PVWA` · `CPM` · `PSM` · `Active Directory` · `PowerShell` · `SAML 2.0` · `MFA` · `SCIM` (in progress)

### What ties it together

The Okta projects demonstrate workforce identity: profiles, lifecycle, federation, and access policies. The CyberArk project adds privileged access management for administrative identities and Windows infrastructure. Together, the lab demonstrates the difference between granting a workforce identity access to applications and controlling how privileged credentials are stored, authorized, used, and monitored.

> All systems, identities, hostnames, and private IP addresses documented here belong to an isolated personal training environment. Secrets and authentication material are intentionally excluded.