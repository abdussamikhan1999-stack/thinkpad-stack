#!/usr/bin/env bash
set -euo pipefail

echo "=== Listening TCP/UDP sockets ==="
ss -tulpn

echo
echo "=== Flagged: bound to 0.0.0.0 / :: (reachable off-box) ==="
ss -tulpn | awk 'NR==1 || $5 ~ /^(0\.0\.0\.0|\*|\[::\]):/'

echo
echo "=== Redis check (the Mirai/Gay-Femboy-botnet scan target) ==="
if command -v redis-cli &>/dev/null; then
  redis-cli ping 2>&1 || echo "redis-cli present but not reachable/unauthenticated locally"
else
  echo "no redis-cli installed, skipping"
fi

echo
echo "Review: anything listed above bound to 0.0.0.0 that isn't Tailscale/SSH/"
echo "something you explicitly mean to expose should be bound to 127.0.0.1 or"
echo "firewalled instead."
