#!/usr/bin/env bash
set -euo pipefail

if command -v docker &>/dev/null; then
  echo "docker already installed"
else
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker "$USER"
  echo "log out/in (or 'newgrp docker') for the group change to take effect"
fi
