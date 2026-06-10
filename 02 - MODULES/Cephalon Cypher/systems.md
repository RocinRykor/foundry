# systems

systems is the enrichment layer of [[Cephalon Cypher]]. It implements the Enrichment trait from [[Awareness]].

It subscribes to the [[Commlink]] signal stream, applies domain intelligence, and routes meaningful output downstream.

---

## The Principle

[[neuroptics]] emits raw. systems makes it mean something.

systems is where domain knowledge lives. It knows what a signal implies, what additional context to fetch, what action to trigger, and where to route the enriched result.

---

## Responsibilities

- Subscribe to relevant signal namespaces from [[Commlink]]
- Apply classification and enrichment rules
- Trigger API requests in response to signals (market lookups, OCR, external data)
- Rate-limit and queue outbound requests
- Route enriched output to [[chassis]], notifications, session archive
- Emit enriched signals back into Commlink for downstream subscribers

---

## Managed API Clients

systems manages API access with rate budgets:

```toml
[api.warframe_market]
base_url = "https://api.warframe.market/v2"
rate_limit_per_minute = 60
fill_idle = true
```

Idle capacity fills with opportunistic background pulls. Every API response emits back into the signal stream — systems is never a terminal node.

---

## Dependency Direction

systems depends on [[neuroptics]] only in the sense that neuroptics produces the signals systems subscribes to. They are fully decoupled — neuroptics can run without systems. The dependency arrow is one-way.

---

## Current State

Planned. The architecture is clear. Implementation follows once neuroptics is stable and emitting reliably into Commlink.

---

## Related

- [[Cephalon Cypher]] — the instance systems lives inside
- [[neuroptics]] — the observation layer systems subscribes to
- [[chassis]] — the interface layer systems feeds
- [[Awareness]] — the theme systems implements
- [[Commlink]] — `PARTICIPANT` node class for most systems nodes
