# Self

Self is how [[Decrypt]] knows what it is, maintains its own continuity, and persists through failure, time, and the gaps between sessions.

It is one of the four themes [[Decrypt]] is built on.

---

## The Traits

### Resilience
The system survives failure without intervention. It monitors itself, detects deviation from a healthy state, and recovers autonomously. It cannot depend on the user to notice something broke.

Resilience requires a self-model. The system has to know what it is supposed to be before it can detect that it has become something else.

### Memory
Persistent external record that does not depend on volatile memory. Memory is the trait that makes re-entry possible — the system holds context so the person doesn't have to carry it manually.

Memory is also the highest-signal input the system has. The most honest data about a person comes from what they recorded when they weren't performing.

### Presence
A node that observes the signal stream and surfaces emotional and state context. Presence is the system's ability to model the person — not just the environment — and recognize when the internal state of the user is relevant to what the system is doing.

Presence is the `AFFECT` node class in [[Commlink]].

---

## Why These Three Together

Resilience keeps the system alive. Memory keeps the person continuous across time. Presence keeps the system aware of the person it exists to serve.

Without Resilience, the system fails silently. Without Memory, every session is a cold start. Without Presence, the system optimizes for the wrong things.

---

## Implementation

- [[NodeSync]] — Resilience. The cluster self-model.
- [[Depot]] — Memory and Presence. External record and affect observation.
- [[Persona]] — Presence applied toward self-modification.

---

## The Care Home Constraint

The end state of Decrypt is a fully automated care environment. This means Self is not optional infrastructure — it is the load-bearing requirement that everything else depends on.

A system that cannot maintain itself cannot care for someone else. Resilience, Memory, and Presence have to be proven at every scale before the system earns the right to act autonomously at the highest ones.
