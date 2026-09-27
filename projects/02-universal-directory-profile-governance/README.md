# 02 — Okta Universal Directory & Profile Governance

## Business requirement

I addressed the need for complete, consistent, and governed identity data before using attributes for automated access decisions.

## What I completed

- I reviewed the default Okta user profile.
- I defined a controlled set of workforce attributes.
- I documented the authoritative source for each attribute.
- I reviewed Okta Expression Language for derived values.
- I validated profile data before relying on it in Group Rules.

## Profile schema I designed

| Attribute | Example | How I used it |
|---|---|---|
| department | Finance | I used it for department-based group assignment. |
| title | Financial Analyst | I used it to describe the user's business role. |
| userType | Employee, Contractor, Intern | I used it for lifecycle and policy decisions. |
| city | New York | I used it for location-aware assignment logic. |
| level | Beginner, Intermediate, Advanced | I used it to model access tiers. |
| managerId | Employee identifier | I documented it for approval workflows. |

## Implementation summary

1. I reviewed the Okta user schema in Profile Editor.
2. I selected the attributes required by the access model.
3. I documented each attribute's type, allowed values, and purpose.
4. I populated test identities with department, type, level, and location data.
5. I checked profiles for missing or inconsistent values.
6. I used the governed attributes as inputs for lifecycle automation.

## Validation results

| Test I performed | Result I observed |
|---|---|
| I populated all required employee fields. | The profile contained complete, policy-ready data. |
| I changed a user's department. | The new value became available to the related Group Rule. |
| I reviewed normalization logic. | The expression produced a consistent result. |

## Production improvements I would make

- I would connect an HR system as the authoritative source.
- I would restrict high-impact attribute changes.
- I would add data-quality reporting and exception handling.
