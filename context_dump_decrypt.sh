#!/usr/bin/env bash
# context_dump_decrypt.sh
# Run from /home/rocin/Decrypt
# Produces a structural snapshot for session restoration.

DECRYPT_ROOT="/home/rocin/Decrypt"
OUTPUT="decrypt_context.md"

if [ "$(pwd)" != "$DECRYPT_ROOT" ]; then
    echo "ERROR: Run this from $DECRYPT_ROOT"
    exit 1
fi

echo "# Decrypt — Context Dump" > "$OUTPUT"
echo "> Generated: $(date '+%Y-%m-%d %H:%M')" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Directory structure ---
echo "## Directory Structure" >> "$OUTPUT"
echo '```' >> "$OUTPUT"

find . \
    -not -path "*/.git/*" \
    -not -path "*/target/*" \
    -not -path "*/.obsidian/*" \
    -not -name "*.lock" \
    -not -name "*.log" \
    -not -name "*_context.md" \
    | sort \
    | sed 's|./||' \
    | awk '{
        n = split($0, parts, "/")
        indent = ""
        for (i = 1; i < n; i++) indent = indent "  "
        print indent parts[n]
    }' >> "$OUTPUT"

echo '```' >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Submodule status ---
echo "## Submodule Status" >> "$OUTPUT"
echo '```' >> "$OUTPUT"
git submodule status 2>/dev/null || echo "(no submodules registered yet)" >> "$OUTPUT"
echo '```' >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Per-submodule last commit ---
echo "## Submodule Last Commits" >> "$OUTPUT"
echo "" >> "$OUTPUT"

git submodule foreach --quiet 'echo "### $name\n- Path: $sm_path\n- Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)\n- Last commit: $(git log -1 --format="%h — %s (%ar)" 2>/dev/null || echo unknown)\n"' >> "$OUTPUT" 2>/dev/null || echo "(submodules not yet initialized)" >> "$OUTPUT"

# --- Vault documents ---
echo "## Vault Documents" >> "$OUTPUT"
echo "" >> "$OUTPUT"

find . \
    -name "*.md" \
    -not -path "*/.git/*" \
    -not -path "*/target/*" \
    -not -name "*_context.md" \
    | sort \
    | sed 's|./||' >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "---" >> "$OUTPUT"
echo "_Drop this file into a new session to restore structural context._" >> "$OUTPUT"

echo "Written to: $OUTPUT"
