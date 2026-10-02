# ThinkPad X1 Carbon (4th Gen) — Debian setup scripts

Run in order on the Debian install already on this machine.

- `00-tailscale.sh` — join your tailnet
- `01-pihole.sh` — network-wide DNS/ad blocking
- `02-jellyfin.sh` — media server
- `03-ollama.sh` — local LLM runtime, picks model size by RAM
- `04-docker.sh` — needed for the compose stack below
- `docker-compose.yml` — SearXNG + self-hosted Matrix (conduit) + Open WebUI
- `05-unattended-upgrades.sh` — automatic security patching
- `06-audit-exposed-services.sh` — flags anything listening on `0.0.0.0`, checks Redis
- `07-check-xz.sh` — checks installed `xz-utils` against the CVE-2024-3094 backdoored versions

Not scriptable: Qubes OS (needs a wipe + checking VT-d is exposed in BIOS
first), Libreboot (not supported on this model), a hardware security key
(needs buying one).

## More tools

[pentest-scripts-notes](https://github.com/abdussamikhan1999-stack/pentest-scripts-notes)
catalogues the top repos under GitHub's `pentest-scripts` topic, if you want
something beyond what's scripted here.
