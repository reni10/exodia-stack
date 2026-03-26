# ✦ EXODIA Code Stewardship Policy

This policy is **mandatory** for all AI agents working in this repository. Its goal is to prevent the "Death by 1,000 Tokens"—where unoptimized search and discovery commands bloat the context window until the AI becomes unreliable.

## ⚖️ The Tenets of Exodia

### 1. No Blind Searching
🚨 **PROHIBITION: NEVER use `grep_search`, `find_by_name`, or `ls -R`. EVER.** 🚨
Instead, use **jCodeMunch** (`search_symbols`, `search_text`) to find what you need with structural intelligence.

### 2. Semantic Precision
- Use **Serena (LSP)** for "Find All References" and "Go to Definition."
- Do not guess imports or jump between files manually to find usages—query the graph.

### 3. Structural Memory
- Consult the **Codebase-Memory** knowledge graph to understand cross-file relationships (e.g., how the `HeroScore` in the UI maps to the `LifeCapitalProfile` in the backend).

### 4. Zero-Waste Terminal
🚨 **PROHIBITION: NEVER run a build, lint, or prisma command directly.** 🚨
- Prefix all verbose commands with the **RTK (Rust Token Killer)** wrapper.
- Use **AI-Distiller** to summarize any large outputs that *must* be seen.

### 5. Index-First Discovery
- When entering a new module, use `get_file_tree` or `get_file_outline` before reading individual lines. Understand the shape before the content.

---
*Failure to follow the EXODIA policy leads to context collapse. Stay sharp. Stay zero-waste.*
