FROM python:3.11-slim
WORKDIR /app

COPY requirements.txt .
COPY docs/ ./docs/
COPY kg-m-based-config.yml .

RUN apt-get update && apt-get install -y \
    git build-essential \
    libgl1 libglib2.0-0 \
    && pip install --no-cache-dir -r requirements.txt \
    && kb-build --input ./docs/ --config ./kg-m-based-config.yml --export ./kg-schema-docs.tar.gz --debug \
    && apt-get purge -y --auto-remove git build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && find /usr/local -type f -name '*.pyc' -delete

EXPOSE 8080
CMD ["kb-mcp-server", "--transport", "sse", "--host", "0.0.0.0", "--port", "8080", "--embeddings", "./kg-schema-docs.tar.gz"]