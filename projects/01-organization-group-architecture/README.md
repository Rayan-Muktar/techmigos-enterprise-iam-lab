# 01 — Okta Organization & Group Architecture

This is my Okta practice project for a simulated company called TechMigos. I set up groups to organize users by department, job function, location, and admin responsibility.

## What I did

I created the groups and descriptions, then tried both manual and rule-based membership with the Finance group. The membership screenshot shows four active users. I also reviewed Okta's standard admin roles, created custom role definitions, and looked through successful events in the System Log.

## RBAC and ABAC

I’m using this project to understand how group membership can control access.

For **ABAC**, I created a Finance Group Rule. I still need to capture the exact profile attribute and rule condition so someone can see why a user is added to Finance.

For **RBAC**, I need to show what access the Finance group gives a user. My current screenshots don't show a group assigned to an app or a tested app role yet.

The flow I want to demonstrate is:

**User attribute → Finance Group Rule → Finance group → app access**

I also want to check an HR user who should not get Finance access. Admin roles are a separate part of the project; I reviewed and created custom role definitions, but haven't shown a test administrator assigned to one.

## Screenshots

I put the screenshots I already have and open spaces for the next ones in [evidence.md](evidence.md).

## What I learned

Creating groups was a good start, but I need to connect the membership rule to an actual access result. That's the next part I want to work through in the Okta tenant.
