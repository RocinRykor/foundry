# Security

Security is the [[Commlink]] module that implements the [[Integrity]] theme. It is the system's guarantee that what moves through the network is what it claims to be, permitted to do what it is trying to do, and earning expanded authority only through demonstrated reliability.

---

## What It Implements

| Trait | What Security Does |
|---|---|
| Trust | Carries declared trust level in every signal envelope |
| Authenticity | Cryptographically verifies signal origin |
| Authorization | Verifies a signal is permitted to cause what it intends |
| Mandate | Tracks demonstrated reliability and graduates autonomy |

---

## Design Constraints

Security is envelope-level. It is not bolted on by downstream modules — it travels with every signal from birth. A signal that bypasses Security is not a Commlink signal.

The attack surface of Decrypt is not a server. It is a person's home, health, finances, and emotional state. This is critical infrastructure.

**The two required checks before any effector node acts:**
1. Did this signal actually come from the node it claims? (Authenticity)
2. Is this signal permitted to trigger this class of action? (Authorization)

Both must pass. Neither alone is sufficient.

---

## Mandate — The Trust Gradient

Mandate is the mechanism by which the system earns the right to act autonomously. It is not granted — it is proven.

A node earns expanded authorization in a domain by operating correctly at lower stakes first. The gradient is domain-specific — a node that has earned high Mandate for environmental controls has not earned it for financial decisions.

The user defines the threshold. The system demonstrates against it. The gradient advances only when the evidence supports it.

This is how Decrypt eventually reaches the care home end state — not by being given autonomy, but by earning it one domain at a time over years.

---

## Related

- [[Integrity]] — the theme Security implements
- [[Commlink]] — the protocol Security lives inside
- [[NodeSync]] — the module that knows which nodes are live and what they have earned
