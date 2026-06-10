#!/usr/bin/env bash
# place_vault_docs.sh
# Run from /home/rocin/Decrypt
# Places the vault .md files generated this session into their correct locations.
# Expects the vault files to be in the same directory as this script.

set -e

DECRYPT_ROOT="/home/rocin/Decrypt"
VAULT_SOURCE="$(dirname "$0")/vault"

if [ "$(pwd)" != "$DECRYPT_ROOT" ]; then
    echo "ERROR: Run this from $DECRYPT_ROOT"
    exit 1
fi

if [ ! -d "$VAULT_SOURCE" ]; then
    echo "ERROR: vault/ directory not found next to this script."
    echo "Expected: $VAULT_SOURCE"
    echo "Make sure you've extracted the vault folder from the session output."
    exit 1
fi

echo "=== Placing vault documents ==="
echo ""

place() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        cp "$src" "$dest"
        echo "  placed: $dest"
    else
        echo "  MISSING: $src"
    fi
}

# Root
place "$VAULT_SOURCE/Decrypt.md" "$DECRYPT_ROOT/Decrypt.md"

# Themes (already in place from setup, but update from vault output)
place "$VAULT_SOURCE/themes/Integrity.md"  "$DECRYPT_ROOT/00 - THEMES/Integrity.md"
place "$VAULT_SOURCE/themes/Awareness.md"  "$DECRYPT_ROOT/00 - THEMES/Awareness.md"
place "$VAULT_SOURCE/themes/Self.md"       "$DECRYPT_ROOT/00 - THEMES/Self.md"
place "$VAULT_SOURCE/themes/Expression.md" "$DECRYPT_ROOT/00 - THEMES/Expression.md"

# Commlink
place "$VAULT_SOURCE/Commlink.md" "$DECRYPT_ROOT/02 - MODULES/Commlink/Commlink.md"

# Modules
place "$VAULT_SOURCE/modules/Security.md"        "$DECRYPT_ROOT/02 - MODULES/Security/Security.md"
place "$VAULT_SOURCE/modules/NodeSync.md"         "$DECRYPT_ROOT/02 - MODULES/NodeSync/NodeSync.md"
place "$VAULT_SOURCE/modules/Depot.md"            "$DECRYPT_ROOT/02 - MODULES/Depot/Depot.md"
place "$VAULT_SOURCE/modules/Persona.md"          "$DECRYPT_ROOT/02 - MODULES/Persona/Persona.md"
place "$VAULT_SOURCE/modules/State Casting.md"    "$DECRYPT_ROOT/02 - MODULES/Persona/State Casting.md"
place "$VAULT_SOURCE/modules/Cephalon Cypher.md"  "$DECRYPT_ROOT/02 - MODULES/Cephalon Cypher/Cephalon Cypher.md"
place "$VAULT_SOURCE/modules/Arbiter.md"          "$DECRYPT_ROOT/02 - MODULES/Arbiter/Arbiter.md"
place "$VAULT_SOURCE/modules/Ghost.md"            "$DECRYPT_ROOT/02 - MODULES/Ghost/Ghost.md"
place "$VAULT_SOURCE/modules/Spool.md"            "$DECRYPT_ROOT/02 - MODULES/Spool/Spool.md"
place "$VAULT_SOURCE/modules/Foundry.md"          "$DECRYPT_ROOT/02 - MODULES/Foundry/Foundry.md"
place "$VAULT_SOURCE/modules/requires.management.md" "$DECRYPT_ROOT/03 - WEBSITES/Requires.Management/requires.management.md"

# Cephalon Cypher sub-components
place "$VAULT_SOURCE/modules/cephalon-cypher/neuroptics.md" "$DECRYPT_ROOT/02 - MODULES/Cephalon Cypher/neuroptics.md"
place "$VAULT_SOURCE/modules/cephalon-cypher/systems.md"    "$DECRYPT_ROOT/02 - MODULES/Cephalon Cypher/systems.md"
place "$VAULT_SOURCE/modules/cephalon-cypher/chassis.md"    "$DECRYPT_ROOT/02 - MODULES/Cephalon Cypher/chassis.md"

# NullPoint
place "$VAULT_SOURCE/modules/Null_Point().md" "$DECRYPT_ROOT/04 - NULLPOINT/NullPoint.md"

echo ""
echo "=== Done ==="
echo ""
echo "Next: git add -A && git commit -m 'vault: place all module documents'"
