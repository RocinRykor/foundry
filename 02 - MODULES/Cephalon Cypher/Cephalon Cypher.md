# Cephalon Cypher

Cephalon Cypher is the domain instance pattern. It is how [[Decrypt]] reaches into a space and begins acting on it.

It is not a Warframe tool. The Warframe instance is first because the feedback loop is tight and the cost of being wrong is zero. Every other domain gets its own instance using the same pattern.

**Cephalon Cypher is Decrypt, instanced.**

---

## The Pattern

Every Cephalon Cypher instance is a cluster of [[Commlink]] nodes organized into three layers:

- [[neuroptics]] — Observation. Watches sources, emits raw events. Knows nothing about what the data means.
- [[systems]] — Enrichment. Subscribes to the signal stream, applies domain intelligence, routes output.
- [[chassis]] — Interface. The cockpit. Where the person observes and interacts with the instance.

```
Source (EE.log / API / sensor / feed)
       ↓
  neuroptics     ← watches, emits raw into Commlink
       ↓
   Commlink       ← routes, delivers
       ↓
    systems       ← enriches, acts, routes downstream
       ↓
    chassis       ← renders, serves
```

---

## Instances

| Instance | Domain | Status |
|---|---|---|
| Warframe | EE.log, World State, WFM market | Active — neuroptics nearly complete |
| Finance / Arbiter | Market feeds, portfolio data | Planned |
| Home Automation | Sensors, switches, environment | Planned |
| Persona / Affect | Emotional state, biometrics | Planned |
| Kitchen | Inventory, recipes, depletion | Planned |

---

## The Warframe Instance

The seed domain. Warframe is the simulation layer — a controlled environment where the architecture gets proven before it is deployed against anything that matters.

**Repos:**
- `github.com/RocinRykor/cephalon-cypher` — daemon workspace (neuroptics, systems, chassis)
- `github.com/RocinRykor/cephalon` — web platform (`warframe.requires.management`)

**Known signal namespace (`warframe.log.*`):**
- `session.hub.returned`, `session.hub.leaving`
- `mission.state.started`, `mission.state.ended`, `mission.name.identified`
- `mission.reward.table.{item}`
- `player.ayatan.sculpture.nearby.{variant}`
- `player.trade.whisper.wfm.{player}.sent`
- `player.nemesis.larvling.weapon.{weapon}.available`

**Discovery queue — patterns not yet captured:**
- Larvling mercy kill / Parazon finisher
- Lich lifecycle (created, appeared, vanquished, converted)
- Mission failed
- Open-world hub entries (Zariman, Cetus, Fortuna, Necralisk, 1999)

---

## The Fractal

```
Decrypt
└── Cephalon Cypher (Warframe)     ← first instance, simulation layer
└── Cephalon Cypher (Finance)      ← Arbiter domain
└── Cephalon Cypher (Home)         ← environment domain
└── Cephalon Cypher (Affect)       ← Persona domain
└── Cephalon Cypher (Kitchen)      ← resource management domain
```

Every instance reports back up to [[NodeSync]], which gives Decrypt a complete self-model of what it is doing across all domains simultaneously.

---

## Related

- [[neuroptics]] — the sensor layer
- [[systems]] — the enrichment layer
- [[chassis]] — the interface layer
- [[Awareness]] — the theme Cephalon Cypher implements
- [[Arbiter]] — the Finance instance
- [[Persona]] — the Affect instance
