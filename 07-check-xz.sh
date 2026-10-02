#!/usr/bin/env bash
set -euo pipefail

version=$(dpkg-query -W -f='${Version}\n' xz-utils 2>/dev/null || echo "not installed")
echo "xz-utils version: $version"

case "$version" in
  *5.6.0*|*5.6.1*)
    echo "WARNING: this matches the backdoored XZ Utils release (CVE-2024-3094). Downgrade now."
    ;;
  "not installed")
    ;;
  *)
    echo "OK: not a known-backdoored version."
    ;;
esac
