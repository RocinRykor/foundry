# Decrypt

Decrypt is a self-composing intelligence organism. Its purpose is to give Steven admin access to his own life — externalizing state, automating decisions, and over time earning the autonomy to act on his behalf without being asked.

The root problem it solves: the brain makes decisions and discards context according to criteria that were never agreed to and cannot be audited. Decrypt is the external system that compensates — persistent where memory is volatile, searchable where recall is broken, patient where executive function fails.

The north star is a fully automated care environment. A system that knows Steven well enough to care for him when he cannot care for himself, and that outlives him.

---

## Structure

Everything in Decrypt is [[Commlink]] at different levels of abstraction.

```
Decrypt
└── Cephalon Cypher instances  (domains)
    └── Commlink nodes          (components)
```

A Cephalon Cypher instance is how Decrypt reaches into a domain and begins acting on it. Every domain — Warframe, finance, home environment, emotional state, kitchen — gets its own instance. The Warframe instance is first because the feedback loop is tight and the cost of being wrong is zero.

---

## The Four Themes

All of Decrypt is built on four themes. Each has its own document.

- [[Integrity]] — signals are what they claim, go where they should, carry the authority they declare
- [[Awareness]] — the system perceives the world
- [[Self]] — the system knows and maintains itself
- [[Expression]] — the system faces outward

---

## Modules

The ecosystem expressed as deployable components.

- [[Commlink]] — the nervous system
- [[Security]] — integrity implementation
- [[NodeSync]] — cluster self-model and resilience
- [[Depot]] — memory and resonance
- [[Persona]] — presence and self-modification
- [[Cephalon Cypher]] — the domain instance pattern
- [[Arbiter]] — resource acquisition
- [[Ghost]] — TTRPG companion
- [[Spool]] — session re-entry
- [[Foundry]] — workspace scaffolding

---

## The Design Question

Every component must answer:

> Does this reduce dependence on unreliable memory, or does it add complexity that requires more of it?

If a feature requires remembering to use it, it is already failing. Build for the user who forgot they were building it.
