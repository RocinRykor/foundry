# Spool

Spool is the session re-entry tool. It is the thing [[00 - Decrypt]] needed to exist before it could build itself.

It answers one question when you open a project: **Where did I leave off, and what do I do next?**

---

## What It Is

A CLI session logger. It runs in the terminal. It captures state at the moment work happens — not at the end of a session when the spark is gone.

It is not a task manager. Not a project planner. Not a kanban board. It is a cursor — the minimal viable record that makes re-entry cheap enough that continuing wins over starting something new.

---

## The Problem It Solves

1. Spark dies mid-session — zero energy for a closing ritual
2. Coming back means reconstructing state from memory — expensive and unreliable
3. Reconstruction cost exceeds motivation — project stalls permanently

Spool's answer: log as you go, not at the end. The record builds from small in-the-moment commands rather than a structured handoff.

---

## Commands

```bash
spool log "finished the auth middleware"
# Appends a timestamped entry. Run in the moment, not at session end.

spool next "implement the JWT decoder"
spool next "implement the JWT decoder" --requires "auth middleware must be complete first"
# Sets the single next action. Overwrites the previous one.
# --requires captures the pre-traced dependency chain while you have the context.

spool status
# The re-entry command. Project name, next action, requirements, last 5 log entries.

spool history --limit 20
spool projects
```

---

## Design Constraints

**No closing ritual.** Any feature requiring deliberate end-of-session work will not be used.

**No configuration.** Works from any directory, no setup, no init step.

**Single next action per project.** The constraint is the feature. One next action means one decision was already made by the version of you who had the context.

---

## Technical Foundation

**Stack:** Rust / clap 4 / SQLite via rusqlite (bundled)
**Storage:** `~/.local/share/spool/spool.db`
**Project detection:** derived from working directory name
**Repo:** `github.com/RocinRykor/spool`

**Current state:** Shipped. All five commands working. In active use.

---

## Related

- [[00 - Decrypt]] — the ecosystem Spool enables
- [[Depot]] — Spool is the session-level memory; Depot is the life-level memory
