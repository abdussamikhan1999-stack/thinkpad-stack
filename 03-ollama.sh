#!/usr/bin/env bash
set -euo pipefail

if command -v ollama &>/dev/null; then
  echo "ollama already installed"
else
  curl -fsSL https://ollama.com/install.sh | sh
fi

# ponytail: pick model size by RAM; 8GB -> phi3/gemma2:2b, 16GB -> llama3.1:8b
ram_gb=$(( $(grep MemTotal /proc/meminfo | awk '{print $2}') / 1024 / 1024 ))
model="phi3"
[ "$ram_gb" -ge 16 ] && model="llama3.1:8b"
echo "RAM: ${ram_gb}GB -> pulling $model"
ollama pull "$model"
