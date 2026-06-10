# neuroptics

neuroptics is the sensor layer of [[Cephalon Cypher]]. It implements the Observation trait from [[Awareness]].

It watches sources and emits raw events into [[Commlink]]. It knows nothing about what the data means.

---

## The Principle

A log watcher knows nothing about Warframe. A sensor knows nothing about what it is measuring. Intelligence lives in the subscriber, not the pipe.

neuroptics is the boundary between the outside world and the Commlink signal stream. Its only job is to watch faithfully and emit completely.

---

## Not Just EE.log

neuroptics is a library of sensors, not a single watcher. The EE.log watcher is the first sensor. Every other domain gets its own sensor pointed at the relevant source.

| Sensor | Source | Status |
|---|---|---|
| EE.log watcher | Warframe game log | Nearly complete |
| World State poller | Warframe World State API | Planned |
| WFM market feed | warframe.market API | Planned |
| Environment survey | Filesystem, process state | Prototype (bash) |
| Biometric reader | Future hardware input | Concept |
| Calendar stream | Calendar API | Concept |
| Stock/market feed | Financial API (Twelve Data) | Concept |

---

## EE.log Watcher — Current State

Three-state inotify machine:

```
Waiting → Attaching → Tailing
```

Uses raw `inotify` bindings deliberately — not the `notify` crate. Chosen for long-term reliability over convenience.

**Workspace:** `cephalon-cypher/neuroptics`
**Binary:** `neuroptics`

```bash
cargo run --bin neuroptics \
  --manifest-path "/home/rocin/Projects/Cephalon Cypher/cephalon-cypher/neuroptics/Cargo.toml"
```

---

## Environment Survey Probe

A neuroptics probe that lands in an unknown environment, surveys it, connects to the nearest Nexus, and emits a Discovery signal per finding.

Classifies:
- `Cargo.toml` (workspace) → Rust workspace
- `.proto` files → speaks a protocol
- `migrations/` → has a database layer
- `*.service` files → deployed as a managed service
- `*.log` files → streamable source, STREAM node applicable

Currently exists as `context_dump.sh`. Canonical form is a Rust binary.

---

## Related

- [[Cephalon Cypher]] — the instance neuroptics lives inside
- [[systems]] — the subscriber that applies intelligence to what neuroptics emits
- [[Awareness]] — the theme neuroptics implements
- [[Commlink]] — `STREAM` node class is the protocol home for neuroptics nodes
