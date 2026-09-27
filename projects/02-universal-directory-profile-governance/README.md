# 02 — Okta Universal Directory & Profile Governance

## Business requirement

Access automation is only reliable when identity data is complete, consistent, and governed. TechMigos needs a profile schema that supports group rules and security policies without storing duplicate or ambiguous attributes.

## Objectives

- Review the default Okta user profile
- Define a small, controlled set of custom attributes
- Establish an authoritative-source strategy
- Use Okta Expression Language for derived values
- Validate data quality before enabling automation
- Protect sensitive attributes from unnecessary editing

## Profile schema

| Attribute | Type | Example | IAM use |
|---|---|---|---|
| `department` | String | Engineering | Department group rules |
| `title` | String | Cloud Engineer | Role-based access |
| `userType` | String | Employee, Contractor, Intern | Lifecycle and policy decisions |
| `city` | String | New York | Location groups and reporting |
| `level` | String | Beginner, Intermediate, Advanced | Training or entitlement tiers |
| `managerId` | String | User identifier | Approval and governance workflows |

## Governance rules

- Use controlled values for department, employment type, and level.
- Avoid creating multiple attributes that represent the same business fact.
- Document the owner, allowed values, and downstream consumers of every custom attribute.
- Keep Okta as the authority for lab identity data until a formal HR source is connected.
- Limit who can edit attributes that drive access.

## Okta Expression Language examples

| Use case | Example expression |
|---|---|
| Display name | `user.firstName + " " + user.lastName` |
| Normalized email | `String.toLowerCase(user.email)` |
| Employee check | `user.userType == "Employee"` |
| Corporate login check | `String.stringContains(user.login, "@oktacertified.com")` |

## Implementation workflow

1. Reviewed the default Okta user profile and required attributes.
2. Added custom attributes needed for the TechMigos access model.
3. Defined data types and allowed values.
4. Populated representative employee, contractor, and intern profiles.
5. Tested expressions using realistic profile values.
6. Verified that profile changes could drive group-rule evaluation.
7. Reviewed profile updates in the System Log.

## Validation tests

| Test | Expected result |
|---|---|
| Create a user without a required attribute | Validation prevents incomplete profile data where enforcement is configured |
| Enter an unsupported employment type | Value is rejected or identified during review |
| Change department from Finance to IT | Dependent group rules reevaluate |
| Evaluate display-name expression | Correct full name is produced |
| Normalize mixed-case email | Lowercase value is produced consistently |
| Modify an access-driving attribute | Profile change is visible in the System Log |

## Security considerations

Attributes that control access are security-relevant data. Poor validation can cause overprovisioning, failed deprovisioning, or unintended policy matches. Production environments should restrict profile editing, use an authoritative HR source, and monitor changes to sensitive fields.

## Outcome

TechMigos now has a documented Universal Directory schema that supports scalable group rules and lifecycle automation without depending on retired application-specific mappings.

## Production improvements

- Connect a real HR source
- Establish an enterprise attribute dictionary
- Add automated data-quality reporting
- Require approvals for sensitive attribute changes
- Test mapping changes in a non-production tenant
