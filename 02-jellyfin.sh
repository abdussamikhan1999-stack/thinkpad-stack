#!/usr/bin/env bash
set -euo pipefail

if command -v jellyfin &>/dev/null; then
  echo "jellyfin already installed"
  exit 0
fi

curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | sudo bash
