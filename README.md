# ✦ EXODIA: The Five-Piece AI Optimization Stack

Exodia is a "zero-waste" development configuration designed for power-users of agentic AI coding assistants (like Antigravity, Claude Engineer, etc.). It combines five specific Model Context Protocol (MCP) servers to drastically reduce token bloat, prevent context collapse, and slash API costs by up to 80%.

## 🧩 The Five Pieces

To "summon" the full power of Exodia, you must integrate all five components:

1.  **jCodeMunch**: Structural project indexing (replaces expensive `cat` and `grep` calls).
2.  **Serena (LSP)**: Semantic navigation (Go-to-Definition / Find-All-References).
3.  **Codebase-Memory**: Institutional architectural knowledge graph.
4.  **AI-Distiller**: Real-time compression of terminal logs and verbose outputs.
5.  **RTK (Rust Token Killer)**: A mandatory terminal wrapper that prunes noise before it hits the context window.

## 🏆 Credits & Components

The EXODIA stack is a curation of the best zero-waste tools in the agentic ecosystem. Credit goes to the original creators:

*   **[jCodeMunch](https://github.com/jgravelle/jcodemunch-mcp)** by [J. Gravelle](https://github.com/jgravelle).
*   **[Serena](https://github.com/oraios/serena)** by [Oraios AI](https://github.com/oraios).
*   **[Codebase-Memory](https://github.com/DeusData/codebase-memory-mcp)** by [DeusData](https://github.com/DeusData).
*   **[AI-Distiller](https://github.com/janreges/ai-distiller)** by [Jan Reges](https://github.com/janreges).
*   **[RTK (Rust Token Killer)](https://github.com/rtk-ai/rtk)** 

## 🔮 Integration Guide: Summoning the Stack

The EXODIA stack is designed for high-performance coding agents like **Antigravity**, **Claude Code**, and **Cursor**. To use it to its full potential, follow these integration patterns:

### 1. The Instruction Layer (`agents.md` / `claude.md`)
Most advanced agents look for a "contract" or "policy" file. You MUST copy the contents of `policy.md` into one of the following files in your project root:
*   `agents.md` (for Antigravity/General Agents)
*   `claude.md` (for Claude Code)
*   `.cursorrules` (for Cursor)
*   `.agent/instructions.md` (for generic agentic workflows)

### 2. Zero-Waste Scripting
Always prefix your commands. Instead of running `npm run build`, use:
```bash
.bin/rtk npm run build
```
This ensures that if the build fails, the agent only sees a **distilled summary** of the errors instead of 5,000 lines of junk that would crash your context window.

### 3. Structural Discovery
Before asking an agent to "find where X is used," remind it: **"Use your jCodeMunch/Serena tools to map the graph first."** This prevents the agent from falling back to expensive `grep` searches.

## 📊 Performance

### 1. Configure MCP Servers
Copy the contents of `mcp_config.json` into your IDE's MCP settings.

### 2. Install RTK
Run the installation script to set up the Rust Token Killer in your path:
```bash
./install_rtk.sh
```

### 3. Enforce the Policy
Add the `EXODIA Code Stewardship Policy` (found in `policy.md`) to your project's `.cursorrules`, `agents.md`, or AI instructions file.

## 📊 Performance
In a typical React/Next.js dashboard overhaul, Exodia has demonstrated:
*   **5.5M+ tokens saved** per 1,000 operations.
*   **$20 - $60 cost savings** per session.
*   **10x higher reliability** in complex refactoring tasks.

## ⚖️ License
MIT. Go forth and build without bloat.
