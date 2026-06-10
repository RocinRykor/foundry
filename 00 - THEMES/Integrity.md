# Integrity

Integrity is the guarantee that what moves through [[Commlink]] is what it claims to be, going where it is supposed to go, carrying the authority it says it has.

It is one of the four themes [[Decrypt]] is built on.

---

## The Traits

### Trust
Every signal carries a declared trust level baked into the envelope at creation. Trust is not assigned by the receiver — it is declared by the sender and verified by the system. It determines what a signal is permitted to cause.

### Authenticity
Cryptographic proof that a signal originates from the node it claims. A signal without verified authenticity cannot be acted upon by an effector node.

### Authorization
The signal is permitted to trigger the class of action it is attempting. Authenticity proves origin. Authorization proves permission. Both must be present for an effector node to act.

### Mandate
Trust that accumulates over time through demonstrated reliability. A node earns expanded authorization in a domain by performing correctly at lower stakes before being granted access to higher ones. Mandate is how the system earns the right to act autonomously — not granted, proven.

---

## Why These Four Together

Trust declares intent. Authenticity proves identity. Authorization proves permission. Mandate governs how far those permissions can grow.

A signal moving through the system carries all four simultaneously. The absence of any one of them is a failure state.

---

## Implementation

The [[Security]] module implements the Integrity theme.

Integrity traits are envelope-level concerns — they exist in the proto and travel with every signal. They are not added by modules after the fact.

---

## Security Implications

A system with this much access to a life — home, health, finances, emotional state — is critical infrastructure. The attack surface is not a server. It is a person.

Every signal must be:
- Verifiable as to origin
- Bounded as to what it can cause
- Earned as to how far its authority extends

This is not a feature added later. It is load-bearing from day one.
