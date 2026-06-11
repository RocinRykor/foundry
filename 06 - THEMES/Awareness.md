# Awareness

Awareness is how [[00 - Decrypt]] perceives the world. Before the system can act on anything, it has to be able to see it — without interpreting, without judging, without losing signal.

It is one of the four themes [[00 - Decrypt]] is built on.

---

## The Traits

### Observation
Watching a source and emitting raw events without interpreting them. The observer knows nothing about what the data means. It only knows how to watch and emit.

A log watcher knows nothing about Warframe. A sensor knows nothing about what it is sensing. Intelligence lives in the subscriber, not the pipe.

### Enrichment
Subscribing to signals, applying domain intelligence, and routing meaningful output downstream. Enrichment is where raw observation becomes actionable information.

### Resonance
The system recognizes the same pattern across time and context. Two signals separated by years, arriving from different domains, vibrating at the same frequency. Resonance is what allows the system to surface a connection between something felt long ago and something being built now.

This is not memory retrieval. Memory returns what was stored. Resonance identifies that two different things are the same thing wearing different clothes.

---

## Why These Three Together

Observation gathers without interpreting. Enrichment interprets what was gathered. Resonance connects what was interpreted across time.

Together they form a complete perceptual loop — from raw signal to meaning to pattern.

---

## Implementation

The [[Cephalon Cypher]] module implements the Awareness theme through its three components:

- [[neuroptics]] — Observation
- [[systems]] — Enrichment
- [[Depot]] — Resonance

Every domain gets its own Cephalon Cypher instance. Every instance uses the same perceptual loop pointed at a different source.
