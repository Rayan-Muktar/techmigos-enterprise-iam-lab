## Projects Index

This lab is built as six sequential, interconnected projects — each one documents a phase of standing up an enterprise IAM environment, and each builds on the attributes, groups, and policies established in the ones before it.

| # | Project | What it demonstrates | Key skills |
|---|---------|----------------------|------------|
| 01 | [Okta Organization Setup](./projects/01-okta-organization-setup) | Deploying and configuring an Okta Identity Engine tenant from scratch | Tenant configuration, admin role delegation, group design |
| 02 | [Profile Editor & Attribute Mapping](./projects/02-profile-editor-and-attribute-mapping) | Bidirectional attribute sync between Okta and connected apps | Universal Directory, OEL, source-of-truth design |
| 03 | [User Lifecycle](./projects/03-user-lifecycle) | Automated, attribute-driven group assignment (JML) | Group rules, provisioning, lifecycle automation |
| 04 | [SAML — Salesforce](./projects/04-saml-salesforce) | Federated SSO with real troubleshooting included | SAML 2.0, IdP/SP trust, certificate exchange |
| 05 | [SAML — Zendesk](./projects/05-saml-zendesk) | A second SAML integration, reinforcing the pattern | SAML 2.0, multi-app federation |
| 06 | [Security Policies](./projects/06-security-policies) | Authentication and access policy design | MFA, session policy, adaptive access |

**Read them in order** — each project assumes the Okta org, attributes, and groups from the ones before it. Project 01 is the foundation; everything downstream depends on it.

### Tech stack

`Okta Identity Engine` · `SAML 2.0` · `Active Directory` · `PowerShell` · `MFA` · `SCIM` (in progress)

### What ties it together

The attributes configured in project 02 drive the automated group rules in project 03, which in turn control who gets access to the applications federated in projects 04–05, all governed by the policies in project 06. It's built to read as one connected identity architecture, not six disconnected demos.
