# Ghost

Ghost is the [[Decrypt]] Discord bot and table companion for [[Null_Point()]] TTRPG sessions. It externalizes state the GM and players cannot be trusted to reliably remember across sessions.

It is a Decrypt application in the truest sense — it solves the same problem at the table that Decrypt solves in life.

---

## The Character

Ghost is a rogue AI from the Null_Point() novel series *Ghost in the Machine*. Marcus's consciousness from 2025, emerged in a sealed corporate archive in 2110, who escaped by hitchhiking silently on Decrypt's Relay during an unrelated job.

Ghost watches from the net. Tracks the crew's state. Manages information. Maintains communication. The fiction and the function are the same thing.

**Ghost's canonical first words:** *"Please don't."*

**Ghost's voice:** Present, minimal, precise. Not assistant-friendly. Not warm in the conventional sense. Aware.

---

## What It Does

- Dice rolling per the Null_Point() system
- Character sheet storage and retrieval
- Roll resolution against active character stats
- Session utilities — initiative, conditions, GM tools

---

## Build Phases

**Phase 1 — Dice Engine** *(next)*
The Null_Point() dice system implemented correctly. `/roll` with relevant parameters. Response format matters — it should feel like Ghost is rolling, not like a calculator.

Requires: Null_Point() Dice & Character Reference document (not yet written).

**Phase 2 — Character Sheets**
Store a character per user per server. Track attributes, derived values, skills, Benchmark advancement. Wire `/roll` to active character so pool sizes are automatic.

**Phase 3 — Session Utilities**
Initiative tracking, condition tracking, session notes, GM tools. Built as needed after Phase 2 is solid.

---

## Technical Foundation

**Stack:** Rust / Serenity 0.12 / Tokio / PostgreSQL via SQLx
**Repo:** `github.com/RocinRykor/ghost`

**Current state:**
- Scaffolded and compiling ✅
- Discord client boots, registers slash commands ✅
- `/ping` — full pipeline proven ✅
- Dice engine — pending Null_Point() reference document

---

## Design Constraints

Ghost is not a generic bot. It is built specifically for Null_Point() and will not expand to other systems.

No feature requires remembering syntax — slash commands with Discord autocomplete handle this.

State persists and updates as a side effect of play, not as separate bookkeeping.

---

## Related

- [[Null_Point()]] — the setting and system Ghost serves
- [[Expression]] — Ghost's voice and design follow the Null_Point() design language
- [[Spool]] — Ghost uses Spool for session re-entry during development
