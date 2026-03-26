# EXODIA Code Stewardship Policy

This policy guides AI agents to minimize token waste. Copy it into your CLAUDE.md, .cursorrules, or agents.md file.

## Tool Preferences

When EXODIA MCP servers are available, prefer them over brute-force alternatives:

### Code Reading
- **Prefer** jCodeMunch `search_symbols` / `get_file_outline` to retrieve specific functions, classes, or types.
- **Avoid** reading entire files when you only need one symbol. A 500-line file costs ~3,800 tokens; a single symbol costs ~700.
- Built-in tools (Read, Grep, Glob) are fine for small files or when jCodeMunch doesn't have what you need.

### Code Navigation
- **Prefer** Serena for Go-to-Definition and Find-All-References when tracing how a function is used across the codebase.
- **Avoid** grepping for function names across dozens of files when an LSP query gives precise results.

### Architecture Understanding
- **Prefer** Codebase-Memory to understand module relationships, dependency graphs, and cross-service connections.
- **Avoid** reading 10+ files just to understand how the app is structured.

### Terminal Output
- **Prefer** prefixing verbose commands with `rtk` (e.g., `rtk npm run build`, `rtk pytest -v`).
- **Avoid** dumping raw build/test output into context. A failed build log can waste 10,000+ tokens when RTK compresses it to ~800.
- Use AI-Distiller for outputs that must be seen in full but can be summarized.

### Discovery
- When entering an unfamiliar module, start with `get_file_outline` or `get_file_tree` to understand the structure before reading individual files.

## What NOT to Do

- Don't read entire files to find one function — use jCodeMunch.
- Don't run verbose commands without RTK — compress first.
- Don't guess at architecture — query the knowledge graph.
- Don't ignore these tools and fall back to brute-force reading when the structured tools are available.
