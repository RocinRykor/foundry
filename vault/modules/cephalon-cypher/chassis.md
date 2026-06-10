# chassis

chassis is the interface layer of [[Cephalon Cypher]]. It implements the Interface trait from [[Expression]].

It is the cockpit — the surface where the person observes what the instance is doing, reviews predictions, scores results, and tunes behavior.

---

## The Principle

Different domain, same cockpit shape.

chassis does not build custom UIs for each domain. It builds a frame library — reusable components — and lets the node describe its own layout. The Warframe instance and the Finance instance and the Kitchen instance all use the same chassis. The domain declares which frames it needs and what data populates them.

---

## Structure

**Frame library** — generic reusable UI components. Domain-agnostic.

**Node modules** — per-node-type default layouts declared by the node itself. The node says "I need a signal feed, a prediction panel, and a tuning interface." chassis assembles it.

**Nexus module** — cluster topology view. Connected nodes, routing table, health status. Every chassis instance can show the state of the whole cluster, not just its own domain.

---

## The Person as Node

chassis is the interface through which Steven is a node in the system.

During the early phase, Steven is in the loop as the refinement layer. He reviews predictions, scores results, adds data points the system requested, and tunes rules. His role shifts over time:

```
Correcting → Reviewing → Watching → Absent
```

The chassis interface changes as his role changes. What was once an active correction surface becomes a monitoring dashboard becomes background infrastructure.

---

## Transport

chassis exposes a WebSocket on a known port. Anything connecting to that port gets the live signal stream — browser, desktop widget, mobile app, stream overlay.

Someone building on top of a [[Cephalon Cypher]] instance can swap chassis entirely without touching [[neuroptics]] or [[systems]]. The signal stream is the interface.

---

## Current State

Planned. The architecture is defined. Implementation follows systems.

---

## Related

- [[Cephalon Cypher]] — the instance chassis lives inside
- [[systems]] — the enrichment layer chassis subscribes to
- [[Expression]] — the theme chassis implements
- [[Null_Point()]] — the design language chassis is built in
