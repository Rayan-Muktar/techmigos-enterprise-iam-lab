# Project 01 — Evidence Index

This folder contains sanitized screenshots for the **Okta Organization & Group Architecture** project. The screenshots in this folder document completed setup work. The RBAC and ABAC validation screenshots belong in [access-control/](./access-control/README.md).

## Existing evidence

| Evidence file | Configuration reviewed | What I demonstrated |
|---|---|---|
| [01-group-directory.png](./01-group-directory.png) | Directory → Groups | I created the TechMigos organizational and departmental group structure. |
| [02-group-membership.png](./02-group-membership.png) | Departmental group → People | I reviewed Finance membership, including rule-managed and manual assignments. |
| [03-standard-admin-roles.png](./03-standard-admin-roles.png) | Security → Administrators → Admin roles | I reviewed standard Okta administrative roles. |
| [04-custom-admin-roles.png](./04-custom-admin-roles.png) | Security → Administrators → Roles | I created and reviewed custom administrative role definitions. |
| [05-system-log-overview.png](./05-system-log-overview.png) | Reports → System Log | I filtered the event timeline for successful activity. |

## RBAC and ABAC evidence to add

See the [screenshot capture checklist](./access-control/README.md) for the intended filenames and capture guidance.

The new evidence should demonstrate this access path:

**User profile attribute → Group Rule → access group → app assignment → access result**

The exact Group Rule expression, app assignment, test outcomes, custom-role assignment, and detailed System Log event are still pending capture. I will mark each item complete only after I configure or test it and save the matching screenshot.

## Evidence handling

I sanitized the existing screenshots before publishing them. Continue to redact personal email addresses, user IDs, IP addresses, session data, tenant identifiers, tokens, and secrets.

> These screenshots document work in a test Okta environment using simulated TechMigos identities.
