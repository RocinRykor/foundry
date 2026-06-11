# Foundry

Foundry is the workspace scaffolding tool. It is part of the [[00 - Decrypt]] toolbox.

---

## What It Does

Creates Cargo workspaces with the correct structure in one command.

```bash
foundry new <workspace-name> --members <member1> <member2> <member3>
```

Creates the workspace directory, runs `cargo new` for each member, writes a workspace `Cargo.toml` with `resolver = "2"`.

---

## Current State

Shipped. Installed at `~/.cargo/bin/foundry`.
**Location:** `/home/rocin/Projects/Foundry/foundry/`

---

## Future — Fabrications

Templates that encode a standard workspace shape.

```bash
foundry new <name> --fabrication decrypt-workspace
```

Not yet implemented. Needs more workspaces built before the patterns are clear enough to codify. When enough [[Cephalon Cypher]] instances exist, the three-crate neuroptics/systems/chassis shape becomes a fabrication.

---

## Related

- [[00 - Decrypt]] — the ecosystem Foundry serves
- [[Cephalon Cypher]] — the workspace shape Foundry will eventually template
