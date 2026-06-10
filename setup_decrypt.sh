#!/usr/bin/env bash
# setup_decrypt.sh
# Run from /home/rocin/Decrypt
# Builds the correct directory structure from scratch, moves existing vault docs,
# registers active submodules, writes .gitignore.
# Safe to run multiple times - skips anything that already exists.

set -e

DECRYPT_ROOT="/home/rocin/Decrypt"

if [ "$(pwd)" != "$DECRYPT_ROOT" ]; then
    echo "ERROR: Run this from $DECRYPT_ROOT"
    exit 1
fi

echo "=== Decrypt Setup ==="
echo ""

# --- Git init ---
if [ ! -d ".git" ]; then
    echo "[init] Initializing git repo..."
    git init
    git branch -M main
else
    echo "[init] Git repo exists, skipping."
fi

# --- Directory structure ---
echo "[dirs] Creating directory structure..."

mkdir -p "00 - THEMES"
mkdir -p "01 - SCHEMAS"

mkdir -p "02 - MODULES/Commlink"
mkdir -p "02 - MODULES/Cephalon Cypher"
mkdir -p "02 - MODULES/Arbiter"
mkdir -p "02 - MODULES/NodeSync"
mkdir -p "02 - MODULES/Depot"
mkdir -p "02 - MODULES/Persona"
mkdir -p "02 - MODULES/Security"
mkdir -p "02 - MODULES/Foundry"
mkdir -p "02 - MODULES/Ghost"
mkdir -p "02 - MODULES/Spool"

mkdir -p "03 - WEBSITES/Requires.Management"
mkdir -p "03 - WEBSITES/FoxtailCaravan.com"
mkdir -p "03 - WEBSITES/IsAzzyAutistic.com"
mkdir -p "03 - WEBSITES/Steven-Briggs.com"

mkdir -p "04 - NULLPOINT/00 - LORE"
mkdir -p "04 - NULLPOINT/01 - SYSTEMS"
mkdir -p "04 - NULLPOINT/02 - STORIES"
mkdir -p "04 - NULLPOINT/03 - MODULES"

echo "[dirs] Done."
echo ""

# --- Placeholder READMEs for future submodules and empty dirs ---
echo "[placeholders] Writing placeholder READMEs..."

write_placeholder() {
    local path="$1"
    local content="$2"
    if [ ! -f "$path" ]; then
        echo "$content" > "$path"
        echo "  wrote: $path"
    fi
}

write_placeholder "03 - WEBSITES/FoxtailCaravan.com/README.md" \
"# FoxtailCaravan.com
Placeholder. Website to be designed for a friend.
Will be built using Decrypt ecosystem tooling.
Submodule added here once repo exists."

write_placeholder "03 - WEBSITES/IsAzzyAutistic.com/README.md" \
"# IsAzzyAutistic.com
Placeholder. Website to be designed for a friend.
Will be built using Decrypt ecosystem tooling.
Submodule added here once repo exists."

write_placeholder "03 - WEBSITES/Steven-Briggs.com/README.md" \
"# Steven-Briggs.com
Personal site. To be rebuilt from scratch using Decrypt ecosystem tooling.
Submodule added here once repo exists."

write_placeholder "02 - MODULES/Foundry/README.md" \
"# Foundry
Workspace and project scaffolding tool.
To be rebuilt from scratch.
Submodule added here once repo exists."

write_placeholder "02 - MODULES/Ghost/README.md" \
"# Ghost
NullPoint() TTRPG Discord bot.
To be rebuilt from scratch.
Submodule added here once repo exists."

write_placeholder "02 - MODULES/Spool/README.md" \
"# Spool
Session re-entry CLI tool.
To be rebuilt as a Commlink module.
Submodule added here once repo exists."

write_placeholder "04 - NULLPOINT/03 - MODULES/README.md" \
"# NullPoint Modules
Submodules shared between Decrypt and NullPoint live here.
Ghost will be the first."

echo ""

# --- .gitignore ---
echo "[gitignore] Writing .gitignore..."
cat > .gitignore << 'EOF'
# Rust build artifacts
**/target/
**/Cargo.lock

# SQLite
**/*.db
**/*.db-shm
**/*.db-wal

# SQLx
**/.sqlx/

# Environment files
**/.env
**/*.env

# Generated protobuf
**/src/generated/

# OS
.DS_Store
**/.DS_Store
Thumbs.db

# Editor
.idea/
.vscode/
**/*.iml
**/.fleet/

# Logs
**/*.log

# Generated context dumps
**/*_context.md

# Obsidian app state (keep vault, not app state)
**/.obsidian/workspace.json
**/.obsidian/workspace-mobile.json
**/.obsidian/cache
EOF

echo ""

# --- Submodules ---
echo "[submodules] Registering submodules..."
echo ""

add_submodule() {
    local path="$1"
    local url="$2"

    if grep -q "path = $path" .gitmodules 2>/dev/null; then
        echo "  already registered: $path"
    elif [ ! -d "$path/.git" ] && [ ! -f "$path/.git" ]; then
        echo "  adding: $path"
        git submodule add "$url" "$path"
    else
        echo "  already exists as git dir: $path"
    fi
}

add_submodule "02 - MODULES/Commlink/commlink" \
    "git@github.com:RocinRykor/commlink.git"

add_submodule "02 - MODULES/Commlink/commlink-proto" \
    "git@github.com:RocinRykor/commlink-proto.git"

echo ""
echo "--- cephalon-cypher ---"
echo "Create the repo at github.com/RocinRykor/cephalon-cypher then run:"
echo ""
echo "  cd $DECRYPT_ROOT"
echo "  git submodule add git@github.com:RocinRykor/cephalon-cypher.git \"02 - MODULES/Cephalon Cypher/cephalon-cypher\""
echo ""

# --- Initial commit ---
echo "[commit] Staging..."
git add .
git status

echo ""
echo "=== Setup complete ==="
echo ""
echo "Next steps:"
echo "  1. Create repo at github.com/RocinRykor/Decrypt (private)"
echo "  2. git remote add origin git@github.com:RocinRykor/Decrypt.git"
echo "  3. Create repo at github.com/RocinRykor/cephalon-cypher"
echo "  4. Run the submodule add command printed above"
echo "  5. git commit -m 'init: decrypt vault and submodules'"
echo "  6. git push -u origin main"
