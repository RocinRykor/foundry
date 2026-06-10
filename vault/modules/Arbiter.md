# Arbiter

Arbiter is the [[Cephalon Cypher]] instance for the Finance domain. It is the resource acquisition engine — the system that ensures Decrypt has what it needs to sustain itself.

---

## What It Does

Arbiter manages resource acquisition across multiple pathways simultaneously. Money is one pathway, not the only one.

**The redundancy requirement:** The system must be able to acquire resources without infinite capital. Every resource type has multiple acquisition pathways — financial, skill-based, time-based, grown, foraged, bartered. When one pathway is blocked, the system already knows the alternatives.

This means Arbiter models:
- Resource types and their depletion rates
- Acquisition pathways per resource type
- Current pathway availability
- Optimal allocation across available pathways

---

## The Training Environment

The Warframe market trading system (`warframe.requires.management`) is the simulation layer for Arbiter. It is running now, collecting data, proving patterns.

The same mechanics that work in a virtual economy — pattern recognition, tiered polling, weighted regression, fractal capital allocation — translate to real markets. The stakes in the simulation are zero. The patterns are real.

**Warframe trading platform current state:**
- Price sampler with tiered polling ✅
- Weighted linear regression prediction engine ✅
- Fractal capital allocation system ✅
- Automated warframe.market order management ✅
- Bootstrap mode (compressed data collection) running ✅

---

## External Data

- **Warframe:** warframe.market v2 API
- **Real-world markets:** Twelve Data API

---

## Current State

The Warframe instance is the active build. Arbiter as a generalized resource acquisition engine is the intended destination once the simulation has proven the patterns.

**Repo:** `github.com/RocinRykor/cephalon` (Warframe trading platform)
**Domain:** `warframe.requires.management`
**Stack:** Rust / Actix-web / PostgreSQL / vanilla JS SPA

---

## Related

- [[Cephalon Cypher]] — the instance pattern Arbiter is built on
- [[Security]] — financial decisions require high Mandate before autonomous action
- [[NodeSync]] — Arbiter reports resource state to the cluster self-model
- [[Persona]] — resource availability feeds back into self-modification planning
