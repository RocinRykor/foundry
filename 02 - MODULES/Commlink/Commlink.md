# Commlink

Commlink is the nervous system of [[00 - Decrypt]]. It is not a tool and not a service — it is the primitive that makes everything else possible. The language by which Decrypt communicates internally, externally, and eventually with itself.

Every Decrypt component carries a Commlink node the same way every cell carries DNA. The node knows how to announce itself, listen, and send. Intelligence lives at the edges. The center just routes.

---

## The Protocol

The proto file is the constitution. Every implementation compiles it. It only ever adds — never removes, renames, or changes the meaning of existing fields.

**Repo:** `github.com/RocinRykor/commlink-proto`
**Current version:** v1.1.0

### The Signal Envelope

Every signal carries:

| Field | Type | Purpose |
|---|---|---|
| `source` | `NodeId` | Which node sent this |
| `created_at` | `int64` | Unix timestamp, milliseconds |
| `priority` | `Priority` | Delivery order and storage strategy |
| `trust` | `TrustLevel` | Declared weight — what this signal is permitted to cause |
| `payload` | `Payload` | What it contains |

### The Four Primitives

| Primitive | Purpose |
|---|---|
| `Message` | Fire and forget. Something happened. |
| `Request` | Something happened and a reply is expected. |
| `Response` | The reply to a request, matched by `correlation_id`. |
| `Discovery` | A pattern was found that has no signal type yet. |

### Node Classes

| Class | Purpose |
|---|---|
| `PARTICIPANT` | Standard node. Announces, sends, receives, does work. |
| `STREAM` | Boundary node with filter layer. Emits Discovery signals. |
| `AFFECT` | Observes signals, surfaces emotional and state context. |
| `NEXUS` | Coordinator that can peer with other Nexus instances. |

### Priority Levels

| Level | Storage |
|---|---|
| `ROUTINE` | Memory buffer only. Gone on restart. |
| `ELEVATED` | Memory buffer with extended window. |
| `CRITICAL` | Persisted to disk. Survives restart. |

---

## The Four Themes

Commlink's design is organized around four themes. Each is its own document.

- [[Integrity]] — how signals are trusted, verified, and authorized
- [[Awareness]] — how the system perceives
- [[Self]] — how the system knows and maintains itself
- [[Expression]] — how the system faces outward

---

## Signal Namespace

Signal types assemble from multiple sources at runtime:

```
{config.namespace}.{ruleset_id}.{directory path}.{signal_type}
```

Example:
```
warframe.log.session.hub.returned
warframe.log.player.nemesis.larvling.weapon.KuvaTonkor.available
```

Wildcard subscription examples:
- `warframe.*` — everything from the Warframe domain
- `warframe.log.player.trade.*` — all trade events

---

## Workspace

**Repo:** `github.com/RocinRykor/commlink`

| Crate | Purpose |
|---|---|
| `commlink-core` | Types, traits, error types |
| `commlink-nexus` | The routing service |
| `commlink-stream` | Runtime rule engine — STREAM node support |

---

## Current State

- `send` returns `Result<SendResponse, CommlinkError>` ✅
- `CompiledRuleSet` pre-compiles all regex at load time ✅
- Proto v1.1.0 pushed ✅
- **Next:** retry policy — exponential backoff, `NodeConfig` fields

## v1.0.0 Milestones

1. **Reliable node communication** — retry policy, acknowledgment, wildcard subscription matching
2. **Nexus resilience** — priority buffer, disk persistence, protocol version negotiation
3. **Clustering** — Nexus-to-Nexus peering, WebSocket transport for remote nodes
