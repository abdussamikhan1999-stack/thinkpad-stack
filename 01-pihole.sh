#!/usr/bin/env bash
set -euo pipefail

if command -v pihole &>/dev/null; then
  echo "pihole already installed"
  exit 0
fi

curl -sSL https://install.pi-hole.net | bash
