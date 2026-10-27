# Screenshots I Still Need for RBAC and ABAC

I made this folder for the next screenshots in my Okta Organization & Group Architecture lab. I will upload each image here after I capture it in my test tenant.

## My screenshot checklist

- [ ] **01-user-profile-attribute.png** — A test user's department or other attribute used by my rule.
- [ ] **02-group-rule-condition.png** — The actual Finance Group Rule, including its condition, target group, and status.
- [ ] **03-rule-membership-result.png** — The user's resulting Finance group membership after the rule runs.
- [ ] **04-rbac-group-app-assignment.png** — The group assigned to a test app and its role or entitlement, if the app supports one.
- [ ] **05-positive-access-validation.png** — A Finance test user receiving the access I intended.
- [ ] **06-negative-access-validation.png** — An HR test user without Finance group membership or Finance app access.
- [ ] **07-mover-access-change.png** — Before-and-after results when I change a test user's department.
- [ ] **08-admin-role-assignment.png** — A test administrator assigned to a custom role, with the role scope visible.
- [ ] **09-system-log-event-detail.png** — A group or role change event with actor, target, event type, timestamp, and outcome.

The rule expression `user.department == "Finance"` is only an example. I will capture the expression and profile attribute that I actually use.

## Before I commit screenshots

I will use simulated test users and redact personal email addresses, user IDs, IP addresses, session data, tenant identifiers, tokens, and secrets. I will keep each screenshot focused on the setting or result it is meant to show.

After I capture an item, I will check it off here and add it to the [screenshot index](../README.md). I will describe a test as complete only after I have run it and saved its result.
