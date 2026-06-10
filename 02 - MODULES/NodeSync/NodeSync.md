# NodeSync

NodeSync is the [[Commlink]] module that implements the Resilience trait from [[Self]]. It is the cluster-wide self-model — [[Decrypt]] knowing what Decrypt is.

Without NodeSync, Decrypt is a collection of tools. With NodeSync, it is an organism.

---

## What It Does

NodeSync tracks:
- Which instances are live
- What each instance knows
- How instances relate to each other
- What a healthy cluster state looks like
- When deviation from health has occurred

It does not route signals — that is [[Commlink]]'s job. NodeSync observes the cluster and surfaces its state.

---

## The Three Layers

```
Commlink     — nervous system. carries signals.
Cephalon Cypher — brain, instanced per domain. does work.
NodeSync     — self-model. Decrypt knowing what Decrypt is.
```

NodeSync is the layer that allows the organism to ask: *is everything that should be running, running? Is everything behaving as expected? What has changed since I last checked?*

---

## Resilience

NodeSync implements Resilience by:
- Maintaining a known-good state model of the cluster
- Detecting when a node has gone silent unexpectedly
- Triggering recovery behavior without user intervention
- Persisting cluster state so it survives restarts

A system that cannot detect its own failures cannot be trusted to act autonomously. NodeSync is a prerequisite for [[Mandate]] advancing in any domain.

---

## Current State

Named and architected. Not yet built.

The `NEXUS` node class in the proto (v1.1.0) is the foundation NodeSync will be built on — a Nexus that can peer with other Nexus instances, forming the cluster topology NodeSync needs to model.

---

## Related

- [[Self]] — the theme NodeSync implements
- [[Commlink]] — the protocol it runs on
- [[Security]] — Mandate requires NodeSync to know what nodes have demonstrated
- [[Cephalon Cypher]] — the instances NodeSync models
