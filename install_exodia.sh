#!/bin/bash
set -e

echo "✦ EXODIA: Installing the AI Optimization Stack"
echo ""

# --- Piece Zero: mcp2cli (Claude Code only) ---
if command -v claude &>/dev/null; then
  echo "→ Installing mcp2cli (Piece Zero)..."
  if [ ! -d "$HOME/.exodia/mcp2cli" ]; then
    git clone https://github.com/myeolinmalchi/mcp2cli.git "$HOME/.exodia/mcp2cli" 2>/dev/null
    echo "  ✓ mcp2cli cloned to ~/.exodia/mcp2cli"
    echo "  → Run: claude --plugin-dir ~/.exodia/mcp2cli"
  else
    echo "  ✓ mcp2cli already installed"
  fi
else
  echo "→ Skipping mcp2cli (Claude Code not found)"
fi

# --- RTK (Rust Token Killer) ---
echo "→ Installing RTK..."
if command -v rtk &>/dev/null; then
  echo "  ✓ RTK already installed ($(rtk --version 2>/dev/null || echo 'unknown version'))"
elif command -v cargo &>/dev/null; then
  cargo install rtk
  echo "  ✓ RTK installed via cargo"
else
  echo "  ⚠ RTK requires Rust. Install Rust first: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
  echo "  Then run: cargo install rtk"
fi

# --- Python MCP servers (jCodeMunch + Serena) ---
echo "→ Checking Python MCP servers..."
if command -v uvx &>/dev/null; then
  echo "  ✓ uvx available — jCodeMunch and Serena will install on first use"
else
  echo "  ⚠ uvx not found. Install uv first: curl -LsSf https://astral.sh/uv/install.sh | sh"
fi

# --- Node MCP servers (Codebase-Memory + AI-Distiller) ---
echo "→ Checking Node MCP servers..."
if command -v npx &>/dev/null; then
  echo "  ✓ npx available — Codebase-Memory and AI-Distiller will install on first use"
else
  echo "  ⚠ npx not found. Install Node.js 18+: https://nodejs.org"
fi

# --- Configure MCP servers ---
echo ""
echo "→ MCP Configuration"
echo "  Copy the contents of mcp_config.json into your agent's settings:"
echo "  • Claude Code: ~/.claude/settings.json under mcpServers"
echo "  • Cursor: Settings → MCP"
echo "  • Windsurf: .windsurf/mcp.json"

# --- Policy ---
echo ""
echo "→ Policy"
echo "  Copy the contents of policy.md into your project's:"
echo "  • CLAUDE.md (Claude Code)"
echo "  • .cursorrules (Cursor)"
echo "  • agents.md (other agents)"

echo ""
echo "✦ EXODIA: Installation complete. Summon the stack and build without bloat."
