#!/bin/bash

echo "✦ EXODIA: Installing the AI Optimization Stack"
echo ""

# --- Piece Zero: mcp2cli (Claude Code only) ---
if command -v claude &>/dev/null; then
  echo "→ Claude Code detected"

  echo "→ Installing mcp2cli (Piece Zero)..."
  if [ ! -d "$HOME/.exodia/mcp2cli" ]; then
    git clone https://github.com/myeolinmalchi/mcp2cli.git "$HOME/.exodia/mcp2cli" 2>/dev/null
    echo "  ✓ mcp2cli cloned to ~/.exodia/mcp2cli"
    echo "  → Run: claude --plugin-dir ~/.exodia/mcp2cli"
  else
    echo "  ✓ mcp2cli already installed"
  fi

  # --- Register MCP servers with Claude Code ---
  echo "→ Registering MCP servers with Claude Code..."

  claude mcp add-json jcodemunch '{"command":"uvx","args":["jcodemunch-mcp"],"env":{"JCODEMUNCH_USE_AI_SUMMARIES":"true"}}' -s user 2>/dev/null && \
    echo "  ✓ jCodeMunch registered" || echo "  ⚠ jCodeMunch already registered or failed"

  claude mcp add-json serena '{"command":"uvx","args":["--from","git+https://github.com/oraios/serena","serena","start-mcp-server"]}' -s user 2>/dev/null && \
    echo "  ✓ Serena registered" || echo "  ⚠ Serena already registered or failed"

  # Codebase-Memory installs itself via its own installer
  if ! command -v codebase-memory-mcp &>/dev/null; then
    echo "  → Installing Codebase-Memory..."
    curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash 2>/dev/null
    echo "  ✓ Codebase-Memory installed (auto-registers with detected agents)"
  else
    echo "  ✓ Codebase-Memory already installed"
  fi

  claude mcp add-json distill '{"command":"npx","args":["-y","@janreges/ai-distiller-mcp"]}' -s user 2>/dev/null && \
    echo "  ✓ AI-Distiller registered" || echo "  ⚠ AI-Distiller already registered or failed"

  echo ""
  echo "  ✓ All MCP servers registered. They'll be available on next Claude Code session."

else
  echo "→ Claude Code not found — skipping mcp2cli and auto-registration"
  echo "  Copy mcp_config.json into your agent's settings manually:"
  echo "  • Cursor: Settings → MCP"
  echo "  • Windsurf: .windsurf/mcp.json"
  echo "  • Copilot/Codex: check your agent's MCP docs"
fi

# --- RTK (Rust Token Killer) ---
echo ""
echo "→ Installing RTK (Rust Token Killer)..."
if command -v rtk &>/dev/null && rtk gain &>/dev/null; then
  echo "  ✓ RTK already installed ($(rtk --version 2>/dev/null || echo 'unknown version'))"
elif command -v brew &>/dev/null; then
  brew install rtk
  echo "  ✓ RTK installed via Homebrew"
elif command -v cargo &>/dev/null; then
  echo "  Installing via cargo (this may take a minute)..."
  cargo install --git https://github.com/rtk-ai/rtk 2>/dev/null
  echo "  ✓ RTK installed"
else
  echo "  Installing via quick install script..."
  curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
fi

# --- Check prerequisites ---
echo ""
echo "→ Checking prerequisites..."
MISSING=0
if command -v uvx &>/dev/null; then
  echo "  ✓ uvx (Python) — jCodeMunch and Serena ready"
else
  echo "  ⚠ uvx not found — install uv: curl -LsSf https://astral.sh/uv/install.sh | sh"
  MISSING=1
fi
if command -v npx &>/dev/null; then
  echo "  ✓ npx (Node) — AI-Distiller ready"
else
  echo "  ⚠ npx not found — install Node.js 18+: https://nodejs.org"
  MISSING=1
fi

# --- Policy reminder ---
echo ""
echo "→ Final step: Add the EXODIA policy to your project"
echo "  Copy policy.md into your project's CLAUDE.md, .cursorrules, or agents.md"
echo "  This teaches the agent to prefer EXODIA tools over brute-force file reading."

echo ""
if [ "$MISSING" -eq 0 ]; then
  echo "✦ EXODIA: Installation complete. Restart your agent to activate."
else
  echo "✦ EXODIA: Partially installed. Fix the warnings above, then restart your agent."
fi
