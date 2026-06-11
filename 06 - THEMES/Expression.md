# Expression

Expression is how [[00 - Decrypt]] faces outward — how it presents itself to the person it serves, and how it carries the identity of the world it was born from.

It is one of the four themes [[00 - Decrypt]] is built on.

---

## The Traits

### Interface
A human-readable cockpit for any [[Cephalon Cypher]] instance. The interface is where the person observes the system, reviews its decisions, scores its predictions, and tunes its behavior.

Interface is not decoration. It is the mechanism by which the person remains in the loop — the cockpit from which Steven is a node.

Every domain instance gets the same cockpit shape. The node declares which frames it needs and what data populates them. The chassis builds a frame library; the node describes its own layout.

### Identity
The feel of the system. The character. The design language. Decrypt does not look like enterprise software. It does not look like a generic smart home dashboard. It looks like something Rezi would use.

Identity is not cosmetic. It is the difference between a tool and an extension of the person using it. When the system feels continuous with the fiction it was born from, re-entry cost drops. The aesthetic is load-bearing.

---

## Why These Two Together

Interface is how the system speaks to the person in the moment. Identity is how it speaks to the person across time — through every surface, every signal name, every piece of vocabulary the system uses.

Together they determine whether Decrypt feels like home or like a foreign object.

---

## Implementation

- [[chassis]] — Interface. The cockpit UI shipped with every Cephalon Cypher instance.
- [[Null_Point()]] — Identity. The design language, naming conventions, and character of the ecosystem.

---

## The Null_Point() Design Language

All Decrypt surfaces derive from the Null_Point() design system.

**Palette:**
- `--static` `#e8202a` — Red. The signal. Primary expressive. Everything that matters.
- `--sprawl-*` — Warm dark substrate. Wet concrete, sodium-lamp orange. Never blue-tinted.
- `--net` `#4dbdb4` — Cyan. Demoted to functional only. Infrastructure voice. Never the hero.

**Typography:**
- Big Shoulders Stencil — display
- EB Garamond / Rajdhani — body
- Share Tech Mono — data and system voice

**The rule:** If it has cyan as its accent color, it is wrong. If backgrounds have a blue tint, they read as a Cascade server room. If display headers don't carry signal weight, they are undercooked.

**Ghost's voice:** Present, minimal, precise. Not assistant-friendly. Aware.
