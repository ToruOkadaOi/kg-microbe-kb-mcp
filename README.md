# KG Microbe KB MCP - Schema Documentation Server

A Model Context Protocol (MCP) server providing AI-powered semantic search and documentation access for the KG Microbe knowledge graph schema, powered by txtai embeddings.

## 🚀 Quick Start (One Command)

```bash
docker-compose up -d
```

That's it! The MCP server will:
1. ✅ Build the Docker image
2. ✅ Start the container on port 8031
3. ✅ Be ready to use at `http://localhost:8031/sse`

**Custom port:**
```bash
PORT=8080 docker-compose up -d
```

## 📋 Prerequisites

- **Docker** (required)
- **docker-compose** or **Docker Desktop** (recommended)

## 🔌 Integration with VS Code

Add to your `.vscode/mcp.json` or VS Code MCP settings:

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

## 📖 What's Included

- **Pre-built knowledge base**: The `kg-schema-docs.tar.gz` contains all preprocessed embeddings
- **txtai embeddings**: Sentence transformer models for semantic search
- **SSE transport**: Server-Sent Events for real-time streaming responses
- **Knowledge graph**: Full KG microbe schema documentation indexed and searchable

## 🛑 Stop the Server

```bash
docker-compose down
```

## 📋 Other Useful Commands

```bash
# View live logs
docker-compose logs -f

# Restart the container
docker-compose restart

# Remove everything (including volumes)
docker-compose down -v

# Check container status
docker-compose ps
```

## 🏗️ Project Structure

```
.
├── Dockerfile              # Multi-stage build with txtai & kb-mcp-server
├── docker-compose.yml      # One-command startup configuration
├── start-mcp.sh           # Convenience startup script
├── requirements.txt       # Python dependencies
├── kg-schema-docs.tar.gz  # Pre-built embeddings knowledge base
├── kg-m-based-config.yml  # Configuration for knowledge base building
└── docs/                  # Documentation source files
```

## 🔧 Troubleshooting

**Port already in use:**
```bash
PORT=8080 bash start-mcp.sh
```

**Container won't start:**
```bash
docker-compose logs
```

**Slow first startup:**
The first run may take 1-2 minutes as Docker builds the image. Subsequent runs are much faster.

## 📝 Building a Custom Knowledge Base

To rebuild the knowledge base from scratch:

```bash
docker-compose up --build
```

The Dockerfile automatically:
1. Installs kb-mcp-server and dependencies
2. Runs `kb-build` with the configuration
3. Creates embeddings from the docs/
4. Exports to kg-schema-docs.tar.gz

## 🤝 Contributing

To modify the documentation and rebuild:

1. Edit files in `docs/`
2. Update `kg-m-based-config.yml` if needed
3. Run `docker-compose up --build`

## 📄 License

See LICENSE file for details.

## 🔗 Related Projects

- [kb-mcp-server](https://github.com/ToruOkadaOi/kb-mcp-server) - The underlying MCP server
- [txtai](https://github.com/neuml/txtai) - Embeddings and semantic search engine
- [Model Context Protocol](https://modelcontextprotocol.io/) - Protocol specification
