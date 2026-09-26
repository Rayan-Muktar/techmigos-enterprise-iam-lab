# 01 — Okta Organization & Group Architecture

## Business requirement

TechMigos needs an Okta Identity Engine tenant that can support workforce identities without relying on inconsistent manual assignments or excessive administrator privilege.

## Objectives

- Configure and brand the Okta tenant
- Establish administrative separation of duties
- Create a scalable group model
- Apply consistent naming and descriptions
- Prepare the tenant for attribute-driven automation
- Verify administrative activity in the System Log

## Environment

| Component | Configuration |
|---|---|
| Platform | Okta Identity Engine |
| Organization | TechMigos Enterprise |
| Environment | Personal developer tenant |
| Primary administration | Super Administrator |
| Identity directory | Okta Universal Directory |

## Group architecture

The original tenant used department, function, location, and administrative groups. The rebuild standardizes these into clear categories:

| Category | Examples | Purpose |
|---|---|---|
| Department | `DEPT-Finance`, `DEPT-Marketing`, `DEPT-HR`, `DEPT-IT` | Represent the organizational structure |
| Role | `ROLE-Helpdesk`, `ROLE-Cloud`, `ROLE-Cybersecurity` | Represent job functions across departments |
| Administration | `ADMIN-Okta-Helpdesk`, `ADMIN-Okta-App`, `ADMIN-Okta-ReadOnly` | Support delegated administration |
| Location | `LOC-New-York` | Support location-aware access decisions |
| Employment type | `TYPE-Employee`, `TYPE-Contractor`, `TYPE-Intern` | Support lifecycle and policy differences |

## Administrative model

- Reserve Super Administrator for a minimal number of accounts.
- Use delegated roles for routine support and configuration.
- Separate help-desk, application, reporting, and policy administration.
- Assign administrative roles through controlled groups where supported.
- Review administrator changes and failed actions in the System Log.

## Implementation summary

1. Activated the Identity Engine tenant and verified administrator access.
2. Applied TechMigos branding and organization settings.
3. Reviewed Directory, Security, Reports, and System Log functions.
4. Created the initial department, function, location, and administrator groups.
5. Documented a cleaner naming model for the new tenant.
6. Identified broad administrator membership as a least-privilege risk.

## Validation tests

| Test | Expected result |
|---|---|
| Create a department group with description | Group appears with clear ownership and purpose |
| Assign a user to a non-admin group | User gains only the intended membership |
| Test delegated help-desk access | Support tasks work while policy and Super Admin functions remain unavailable |
| Review a group or admin change | Matching event appears in the System Log |
| Attempt an unauthorized admin action | Action is blocked and logged |

## Key design decisions

**Groups represent one purpose.** Department membership, administrator authority, and application access should not be combined into a single group.

**Administrative access follows least privilege.** Routine help-desk work does not justify Super Administrator access.

**Naming is part of governance.** Prefixes make group intent understandable during reviews and troubleshooting.

## Outcome

The tenant now has a documented foundation for profile governance, lifecycle automation, and policy enforcement. The next project defines the attributes that drive this group architecture.

## Production improvements

- Connect an HR system as the authoritative source
- Maintain a formal role and entitlement matrix
- Review administrator assignments regularly
- Use break-glass accounts with monitored emergency procedures
- Export System Log events to a SIEM
