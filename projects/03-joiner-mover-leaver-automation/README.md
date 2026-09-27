# 03 — Okta Joiner-Mover-Leaver Automation

## Business requirement

I addressed the risk created by manual assignments by designing attribute-driven lifecycle controls for joiners, movers, and leavers.

## What I completed

- I standardized the attributes required for lifecycle decisions.
- I created Group Rule logic for department and employment-type assignments.
- I tested a joiner by creating a policy-ready user profile.
- I tested a mover by changing a user's department.
- I documented and tested the leaver process using suspension or deactivation.
- I reviewed membership results and related Okta events.

## Automation logic I used

| Scenario | Condition I evaluated | Result I validated |
|---|---|---|
| Finance employee | Department equaled Finance | I assigned the user to the Finance group. |
| Marketing employee | Department equaled Marketing | I assigned the user to the Marketing group. |
| Contractor | User type equaled Contractor | I assigned the user to contractor access. |
| Intern | User type equaled Intern | I assigned the user to intern access. |
| New York worker | City equaled New York | I assigned the user to the location group. |

## Tests I performed

### Joiner

1. I created and activated a test identity.
2. I populated the required profile attributes.
3. I verified the expected group membership and access state.

### Mover

1. I changed the test user's department.
2. I allowed the Group Rule to reevaluate the profile.
3. I verified that old access was removed and new access was added.

### Leaver

1. I suspended or deactivated the test user.
2. I verified that the user could no longer sign in.
3. I reviewed access removal and the related System Log event.

## Production improvements I would make

- I would integrate an authoritative HR source.
- I would add approvals for sensitive access.
- I would define service-level targets for leaver deprovisioning.
- I would add reconciliation and exception reporting.
