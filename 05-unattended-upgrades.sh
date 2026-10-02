#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y unattended-upgrades apt-listchanges

sudo tee /etc/apt/apt.conf.d/20auto-upgrades >/dev/null <<'EOF'
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF

echo "unattended-upgrades installed and enabled. Check status with:"
echo "  systemctl status unattended-upgrades"
echo "  sudo unattended-upgrade --dry-run --debug"
