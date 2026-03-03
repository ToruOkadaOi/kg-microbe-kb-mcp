# KG Microbe KB MCP

Model Context Protocol server providing semantic search and documentation access for the KG Microbe knowledge graph schema.

## Quick Start

```bash
docker-compose up -d
```

The server starts on `http://localhost:8031/sse`. To use a different port:

```bash
PORT=8080 docker-compose up -d
```

## Prerequisites

- Docker
- docker-compose

## Integration

### VS Code

Add to `.vscode/mcp.json`:

```json
{
  "servers": {
    "kg-schema-docs": {
      "type": "sse",
      "url": "http://localhost:8031/sse"
    }
  }
}
```

### OpenCode

Add to `opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "kg-schema-docs": {
      "type": "remote",
      "url": "http://localhost:8031/sse",
      "enabled": true,
      "timeout": 5000
    }
  }
}
```

## Commands

```bash
# Stop server
docker-compose down

# View logs
docker-compose logs -f

# Rebuild from source
docker-compose up --build
```

## Configuration

Copy `.env.example` to `.env` to customize settings. See `.env.example` for available options.
