# 01 — Okta Organization & Group Architecture

This is a record of what I set up in my Okta Identity Engine practice tenant for the simulated TechMigos workforce, what I saw in the tenant, and what I still need to test.

## What I set up

- I created groups for departments, job functions, location, and administration.
- I created a Finance Group Rule and reviewed its membership. The screenshot shows four active users, with both rule-managed and manual members.
- I reviewed Okta's standard admin roles and created custom role definitions.
- I filtered the System Log for successful events.

The screenshots below show those parts of the lab. They don't yet show a complete app-access test.

## How I’m applying ABAC and RBAC

I think of **ABAC** as using a user's attributes to decide which access group they should enter. In my lab, I created a Finance Group Rule. I still need to capture the exact rule and the profile attribute it checks.

I think of **RBAC** as using a role or group to give someone a defined level of access. My current screenshots show the group structure, but they don't show a group assigned to an app or prove what access a member receives.

The end-to-end path I want to test is:

**User attribute → Group Rule → access group → app assignment → verified access**

For example, I could test whether a user's Finance department attribute puts them in the Finance group, then assign that group to a test app. I would also check that an HR test user does not receive Finance access. The exact rule and test results need to come from my tenant; I haven't documented them here yet.

I keep administrator access separate. Okta Group Rules can't assign users to admin groups, so I need to review and assign admin roles through the administrator controls.

## Screenshots from my lab

### Group directory

![Okta group directory](images/01-group-directory.png)

I used this to review the group names, descriptions, and directory counts.

### Finance group membership

![Finance group membership](images/02-group-membership.png)

I reviewed four active Finance users and saw both rule-managed and manual membership.

### Standard administrator roles

![Standard Okta administrator roles](images/03-standard-admin-roles.png)

I reviewed Okta's standard administrator role options.

### Custom administrator roles

![Custom Okta administrator roles](images/04-custom-admin-roles.png)

I created and reviewed custom role definitions. This screenshot does not show a test administrator assigned to one of those roles.

### System Log overview

![Filtered Okta System Log overview](images/05-system-log-overview.png)

I filtered the event timeline for successful activity. I still need a detailed event screenshot showing the actor, target, event type, timestamp, and outcome.

## What I still need to capture

I made an [access-control screenshot checklist](images/access-control/README.md) and a folder for the next screenshots. The main items are:

- The actual Finance Group Rule and the profile attribute it checks.
- A test user's attribute and resulting Finance group membership.
- A group-to-app assignment and the role or entitlement, if the app supports it.
- A positive Finance access test and a negative HR access test.
- A custom admin role assigned to a test administrator.
- A detailed System Log event for a group or role change.

I will update this page as I complete those steps. I don't want the project to suggest I tested something until I have the result and screenshot.

## What I learned

Creating groups is only part of the work. I need to show why a user qualifies for a group, what access the group grants, and how I checked the result. The Finance group is a start; testing the rule and an app assignment is the next step.
