# 04 — Okta Adaptive Access & MFA Policies

## Business requirement

I designed layered authentication controls that protected workforce access while applying stronger requirements to administrators, sensitive resources, and untrusted contexts.

## What I completed

- I reviewed the available authenticators and enrollment controls.
- I designed a Company Access global session policy.
- I documented stronger requirements for privileged administrator access.
- I organized authentication rules from specific conditions to fallback rules.
- I tested expected allow, challenge, and deny outcomes.
- I used the System Log to review sign-in and policy-evaluation events.

## Controls I implemented

| Control | Configuration I applied |
|---|---|
| Authenticator enrollment | I required approved factors for the relevant users. |
| Global session policy | I defined session behavior for trusted and untrusted contexts. |
| Application policy | I applied resource-specific authentication requirements. |
| Privileged access | I required stronger verification for administrator access. |
| Rule priority | I placed high-risk rules above broad fallback rules. |
| Logging | I reviewed authentication and policy events in the System Log. |

## Rule ordering I used

1. I placed administrator and high-risk rules first.
2. I placed application-specific rules below them.
3. I placed trusted-network conditions after sensitive-resource rules.
4. I kept the broad fallback rule last.

## Validation results

| Test I performed | Result I observed |
|---|---|
| I signed in under a standard workforce condition. | The expected session and authentication requirements applied. |
| I tested privileged access. | Stronger verification was required. |
| I tested an untrusted context. | The policy required additional assurance or denied access. |
| I reviewed the System Log. | The authentication and policy-evaluation events were recorded. |

## Production improvements I would make

- I would introduce phishing-resistant authenticators where supported.
- I would integrate managed-device and device-assurance signals.
- I would create named network zones from approved corporate ranges.
- I would monitor repeated failures and policy-denied events.
