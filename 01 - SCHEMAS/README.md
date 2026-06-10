# decrypt-schemas

Protocol Buffer definitions for the Decrypt ecosystem.

## Structure
- `proto/common.proto` — shared envelope, auth, and acknowledgement types
- `proto/nodes.proto` — node registry and health (NodeSync)
- `proto/events.proto` — async event bus pub/sub
- `proto/commands.proto` — command dispatch and results
- `proto/registry.proto` — app registration and discovery

## Versioning
Follows semantic versioning. Field numbers are permanent — never removed or renumbered.
