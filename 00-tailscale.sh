#!/usr/bin/env bash
set -euo pipefail

if command -v tailscale &>/dev/null; then
  echo "tailscale already installed"
else
  curl -fsSL https://tailscale.com/install.sh | sh
fi

sudo tailscale up
