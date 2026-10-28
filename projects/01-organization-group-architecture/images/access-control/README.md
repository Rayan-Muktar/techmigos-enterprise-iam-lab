# RBAC and ABAC Screenshot Drop Area

Add the new screenshots for Project 01 to this folder. Keep the existing screenshots in the parent `images/` folder.

## Capture checklist

| Suggested filename | Capture | Status |
|---|---|---|
| `01-user-profile-attribute.png` | A test user's relevant profile attribute (for example, department). | Needed |
| `02-group-rule-condition.png` | The Finance Group Rule condition, target group, and active status. | Needed |
| `03-rule-membership-result.png` | The resulting Finance group membership after the rule evaluates. | Needed |
| `04-rbac-group-app-assignment.png` | The access group assigned to a test app, including its app role or entitlement when supported. | Needed |
| `05-positive-access-validation.png` | A Finance test user receiving the expected app access. | Needed |
| `06-negative-access-validation.png` | An HR test user not receiving Finance membership or Finance app access. | Needed |
| `07-mover-access-change.png` | Before-and-after evidence that a department change removes old access and grants the new access. | Recommended |
| `08-admin-role-assignment.png` | A test administrator assigned a custom role, with the role's scope visible. | Needed |
| `09-system-log-event-detail.png` | A relevant group or role change event with actor, target, event type, timestamp, and outcome. | Needed |

The expression `user.department == "Finance"` is only an example. Capture the actual rule and actual profile attribute configured in your tenant.

## Safe screenshot handling

Use simulated test users. Redact personal email addresses, user IDs, IP addresses, session data, tenant identifiers, tokens, and secrets before committing screenshots. Keep the screenshot focused on the setting or result being demonstrated.

When a screenshot is uploaded, change its status above to **Added** and link it to the evidence index in the parent `images/README.md`. Only describe a test as completed after you have run it and captured the result.
