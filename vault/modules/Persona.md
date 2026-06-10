# Persona

Persona is the [[Commlink]] module that implements the Presence trait from [[Self]]. It is the self-modification system — the mechanism by which Steven defines a target state and Decrypt finds low-friction ways to move toward it incrementally.

Persona does not make changes. It identifies what works, embeds effective inputs into existing routines, and tracks whether the movement is real.

---

## What It Does

1. **Define a target state** — what does the person want to become, or what state do they want to maintain?
2. **Track inputs** — what environmental, physiological, and behavioral factors are in play?
3. **Track outputs** — what is the measurable effect on affect, focus, behavior, and wellbeing?
4. **Find correlations** — which inputs reliably produce which outputs for this specific person?
5. **Embed effective inputs** — once a correlation is confirmed, introduce it at low enough intensity that it nudges rather than interrupts
6. **Monitor drift** — is the movement still happening? Has the effect changed?

---

## The Specificity Principle

Persona's output is personal, not universal. The system finds what works for Steven, not what works on average. This means the training data is entirely first-person — no external benchmarks, no population averages. The only valid signal is what this body in this context actually does.

---

## Example — THC Tracking

Tracking strain, method, dose, and timing against observed affect, focus, and behavior. Finding correlations. Once a reliable nudge-level dose is identified, embedding it into neutral recipes at a concentration too low to produce a recreational effect but sufficient to produce the target cognitive shift.

This is not drug use as recreation. It is pharmacological self-modification with feedback loops.

---

## [[State Casting]] — Persona's First Answer

State Casting is what Persona found when it looked at Steven specifically. The creative feedback loop is his self-modification mechanism — emotion as fuel, creation as conversion, presence as the multiplier.

State Casting is not Persona. It is one answer Persona arrived at. Other people running Persona would arrive at different answers.

The [[Depot]] is where State Casting sessions are logged and where Persona finds its highest-signal data.

---

## Current State

Conceptual. The mechanics are understood. The implementation depends on:
- [[Depot]] being live enough to capture the input/output data
- [[chassis]] providing an interface for reviewing correlations
- [[Commlink]] `AFFECT` node class being implemented

---

## Related

- [[Self]] — Presence trait
- [[State Casting]] — the specific mechanic Persona found for Steven
- [[Depot]] — primary data source for Persona's pattern recognition
- [[Awareness]] — Resonance is what lets Persona surface non-obvious connections
- [[Security]] — Mandate governs how far Persona can act autonomously
