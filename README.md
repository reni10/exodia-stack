# ✦ EXODIA: The Complete AI Optimization Stack

Exodia is a zero-waste development configuration for agentic AI coding assistants like **Claude Code**, **Cursor**, **Windsurf**, **Copilot**, **OpenAI Codex**, and **Antigravity**. It combines six tools to reduce token bloat, prevent context collapse, and cut costs — particularly valuable for developers on the **Claude Pro $20/month plan** who need to make every token count.

## 🔮 Piece Zero: The Foundation

Before adding any MCP servers, install this first. Every MCP server you add dumps its full tool schema into the context window on every message. With 5 servers, that's 20-50k tokens of tool descriptions eating your context before you even type anything. mcp2cli eliminates this overhead entirely.

| Piece | What It Does | Token Savings |
| :--- | :--- | :--- |
| **[mcp2cli](https://github.com/myeolinmalchi/mcp2cli)** | Converts MCP servers into CLI tools so their schemas aren't loaded into context. Without this, the other 5 pieces ironically add their own token bloat. | 96-99% on tool schema overhead |

## 🧩 The Five Pieces

With Piece Zero handling the overhead, these five components do the real work. Each delivers value independently:

| Piece | What It Does | Token Savings |
| :--- | :--- | :--- |
| **[jCodeMunch](https://github.com/jgravelle/jcodemunch-mcp)** | Structural project indexing via tree-sitter AST. Returns exact symbols instead of entire files. | 80-95% on code reading |
| **[Serena (LSP)](https://github.com/oraios/serena)** | Semantic navigation — Go-to-Definition, Find-All-References via Language Server Protocol. | 60-70% on code navigation |
| **[Codebase-Memory](https://github.com/DeusData/codebase-memory-mcp)** | Persistent knowledge graph of your codebase architecture. 64 languages, sub-ms queries. | 70-90% on architecture discovery |
| **[AI-Distiller](https://github.com/janreges/ai-distiller)** | Real-time compression of verbose terminal outputs. | 50-80% on log/output parsing |
| **[RTK (Rust Token Killer)](https://github.com/rtk-ai/rtk)** | CLI proxy that compresses command output before it hits the context window. Single Rust binary. | 60-90% on command outputs |

## 🛡️ Why This Matters: Coding on the $20 Plan

The Claude Pro plan has a usage-based rate limit per 5-hour window. Without optimization, agents waste most of your token budget on **reading files and parsing output** rather than **writing code**. EXODIA flips that ratio.

### The Comparison

| Operation | Without Exodia | With Exodia |
| :--- | :--- | :--- |
| **Reading a function** | Read entire 500-line file (~3,800 tokens) | Retrieve exact symbol (~700 tokens) |
| **Finding all usages** | `grep` + read 5 files (~12,000 tokens) | LSP Find-All-References (~500 tokens) |
| **Build error debugging** | 500 lines of raw output (~10,000 tokens) | Compressed summary (~800 tokens) |
| **`git push` output** | ~200 tokens | ~10 tokens |
| **`pytest` (33 tests)** | ~756 tokens | ~24 tokens |

The result: significantly more messages per rate-limit window, and longer productive sessions before you hit the wall.

## 🚀 Quick Start

### Prerequisites

- **Python 3.8+** with `uvx` (for jCodeMunch and Serena)
- **Node.js 18+** with `npx` (for Codebase-Memory and AI-Distiller)
- **Rust toolchain** (for RTK) — or use the pre-built binary

### 1. Configure MCP Servers

Copy the contents of `mcp_config.json` into your agent's MCP settings:
- **Claude Code**: `~/.claude/settings.json` under `mcpServers`
- **Cursor**: Settings → MCP
- **Windsurf**: `.windsurf/mcp.json`

### 2. Install RTK

```bash
./install_exodia.sh
```

Or install RTK manually:
```bash
cargo install rtk
```

Then prefix verbose commands:
```bash
rtk npm run build
rtk pytest -v
rtk cargo build
```

### 3. Add the Policy File

Copy the contents of `policy.md` into your project's instruction file:
- `CLAUDE.md` (for Claude Code)
- `.cursorrules` (for Cursor)
- `agents.md` (for other agents)

This tells the agent to prefer EXODIA tools over brute-force file reading.

## ⚡ First-Time Indexing

Before EXODIA can protect your context window, it needs to build its indexes:

1. **jCodeMunch**: Ask your agent to run `mcp_jcodemunch_index_folder` — creates the symbol map (classes, functions, types).
2. **Codebase-Memory**: Ask the agent to scan the project — builds the architectural knowledge graph.
3. **Serena**: Ask the agent to perform a reference check on a core module — verifies the LSP is mapping correctly.

Once indexed, all three track changes incrementally. You only do this once per project.

## 🔮 Integration Tips

### Structural Discovery
Before asking an agent to "find where X is used," prompt it: **"Use jCodeMunch/Serena to look this up."** This prevents fallback to expensive `grep` + full file reads.

### Zero-Waste Debugging
When a build fails, the agent normally dumps the entire error log into context. With RTK, it only sees a compressed summary of what actually went wrong.

### Architecture Questions
Instead of the agent reading 20 files to understand how your app is structured, Codebase-Memory provides the dependency graph and module relationships in a single query.

## ⚠️ Known Limitations

- **Serena** works best with Python, TypeScript/JavaScript, Go, Rust, and Java. Other languages have partial LSP support.
- **jCodeMunch** indexing can take a minute on very large repos (100k+ files). Incremental updates are fast after that.
- **RTK** requires Rust to compile from source. Pre-built binaries are available for macOS and Linux.
- **AI-Distiller** adds the most value on very verbose outputs (build logs, test suites). For short commands, the overhead isn't worth it.
- The stack adds 4 MCP server processes to your system. On resource-constrained machines, start with just **jCodeMunch + RTK** for the biggest impact with the least overhead.

## 🏆 Credits

EXODIA is a curation of the best zero-waste tools in the agentic ecosystem. Full credit to the original creators:

- **[mcp2cli](https://github.com/myeolinmalchi/mcp2cli)** by [myeolinmalchi](https://github.com/myeolinmalchi)
- **[jCodeMunch](https://github.com/jgravelle/jcodemunch-mcp)** by [J. Gravelle](https://github.com/jgravelle)
- **[Serena](https://github.com/oraios/serena)** by [Oraios AI](https://github.com/oraios)
- **[Codebase-Memory](https://github.com/DeusData/codebase-memory-mcp)** by [DeusData](https://github.com/DeusData)
- **[AI-Distiller](https://github.com/janreges/ai-distiller)** by [Jan Reges](https://github.com/janreges)
- **[RTK](https://github.com/rtk-ai/rtk)** by [RTK AI](https://github.com/rtk-ai)

## ⚖️ License

MIT. Go forth and build without bloat.
