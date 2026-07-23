# 👤 User Lifecycle Management

This one covers the full lifecycle of a user account in Okta — from the moment someone's created to the point they're deleted for good.

## Objective

Manage users end-to-end the way an IT admin actually would: onboarding, profile updates, group/app assignment, and eventually offboarding (suspend, deactivate, delete).

## What I did

Started by creating a handful of test users manually to get a feel for the create flow, then moved into managing them through their lifecycle — updating profile fields, adding them to groups, assigning apps, and eventually walking them through suspension and deactivation.

I also went back and built out **group rules** so that group assignment isn't manual anymore. Instead of adding people to groups by hand, users get assigned automatically based on their `department` or `title` attribute — the same attributes set up in [Profile Editor & Attribute Mapping](../02-profile-editor-and-attribute-mapping). That's really the point of doing attribute work first: it's what makes rules like this possible.

- If `user.department` equals `Finance` → assigned to TechMigos Finance Group
- If `user.title` equals `Cloud Professional` → assigned to TechMigos Cloud Professionals
- If `user.title` equals `Human Resource Associate` → assigned to TechMigos HR Group
- If `user.title` equals `Marketing Professional` → assigned to TechMigos Marketing Group
- If `user.login` contains `@oktacertified.com` → assigned to TechMigos Okta Admins

![Group Rules](./screenshots/group-rules.png)

Each rule also has an `Except` condition available, which I left empty for this lab — but in a real org that's where you'd exclude specific people from a rule that would otherwise catch them. A VP with the title "Marketing Professional," for example, might need to skip the standard Marketing group rule if they're meant to sit in a different group entirely.

I ended up disabling the Okta Admins rule after testing it (currently marked Inactive) since it was matching more accounts than I wanted while I was still testing — a good reminder that rule conditions need to be scoped carefully before going live, not just logically correct.

![Groups Overview](./screenshots/groups-overview.png)

This is really the piece that ties lifecycle management to something real — in an actual company, nobody's manually dragging 500 employees into the right groups. The group rules do that work the moment HR data changes a person's title or department.

## Steps covered

- Created new users
- Updated user profiles
- Built group rules for automatic, attribute-based group assignment
- Assigned applications
- Suspended accounts
- Reactivated accounts
- Deactivated accounts
- Deleted accounts

## Screenshots

![User Directory](./screenshots/user-directory.png)
*User directory showing all provisioned accounts*

![Create User](./screenshots/create-user.png)
*Creating a new user in Okta*

![User Profile](./screenshots/user-profile.png)
*Editing a user's profile attributes*

![Application Assignment](./screenshots/app-assignment.png)
*Assigning applications to a user*

![Suspend User](./screenshots/suspend-user.png)
*Suspending a user account*

![Deactivate User](./screenshots/deactivate-user.png)
*Deactivating a user account*

## Skills demonstrated

User provisioning, group rule design, attribute-based access assignment, application assignment, and the full account lifecycle (create → suspend → reactivate → deactivate → delete).

## Outcome

Managed the complete user lifecycle in Okta, and moved group assignment from a manual process to an automated, attribute-driven one using group rules. That second part is the difference between "I can click buttons in Okta" and "I understand how this scales past a handful of test users."
