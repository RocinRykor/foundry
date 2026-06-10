# requires.management

requires.management is the central hub platform and subdomain router for [[Decrypt]]'s web-facing layer. It manages identity, authentication, and routes traffic to the correct [[Cephalon Cypher]] chassis instance.

---

## What It Does

- Central identity and auth layer (Discord OAuth2)
- Four-tier user system: Transient → Resident → Operator → Architect
- Subdomain routing to active chassis instances
- Hosts the hub interface

---

## Technical Foundation

**Stack:** Rust / Actix-web / PostgreSQL / vanilla JS SPA
**Server:** CASCADE-NEXUS-001 (Raspberry Pi, aarch64, Arch Linux)
**Repo:** `github.com/RocinRykor/requires-management`
**Web server:** Nginx + Certbot SSL
**CI:** Self-hosted GitHub Actions runner on Pi

---

## Active Subdomains

| Subdomain | Instance | Status |
|---|---|---|
| `warframe.requires.management` | [[Arbiter]] / Warframe trading platform | Running |
| `ffxi.requires.management` | Carbuncle (FFXI Blue Mage tool) | Foundation laid — DB seeded, schema created |
| hub | Central dashboard | Planned |

---

## Infrastructure Reference

| Item | Detail |
|---|---|
| Server | CASCADE-NEXUS-001 |
| OS | Arch Linux aarch64 |
| System user | `ghost` |
| DB app user | `cypher_app` |
| Runner name | `cascade-nexus-001` |
| Runner labels | `self-hosted`, `Linux`, `ARM64`, `cascade-nexus` |
| Runner service | `actions.runner.Steven-Briggs.cascade-nexus-001` |

**Deployment pattern:** Native `cargo build --release` on Pi. Atomic deploys via `.new` + `mv`. No cross-compilation.

**Database:** PostgreSQL via SQLx. All permanent changes through migrations. Manual psql is diagnostic only.

---

## Related

- [[Cephalon Cypher]] — the instances requires.management routes to
- [[chassis]] — the interface layer requires.management hosts
- [[Decrypt]] — the ecosystem this infrastructure serves
