#!/usr/bin/env bash
# Install or uninstall the DNS health-check monitor.
#
# Usage:
#   ./install.sh            # install + enable timer
#   ./install.sh uninstall  # disable timer + remove files
#
# Files installed:
#   ~/.local/bin/dns-health-check
#   ~/.config/systemd/user/dns-health-check.service
#   ~/.config/systemd/user/dns-health-check.timer

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DST="$HOME/.local/bin/dns-health-check"
SVC_DST="$HOME/.config/systemd/user/dns-health-check.service"
TMR_DST="$HOME/.config/systemd/user/dns-health-check.timer"

action=${1:-install}

case "$action" in
  install)
    mkdir -p "$(dirname "$BIN_DST")" "$(dirname "$SVC_DST")"
    install -m 0755 "$SRC/dns-health-check" "$BIN_DST"
    install -m 0644 "$SRC/dns-health-check.service" "$SVC_DST"
    install -m 0644 "$SRC/dns-health-check.timer"   "$TMR_DST"
    systemctl --user daemon-reload
    systemctl --user enable --now dns-health-check.timer
    echo "Installed. Live tail: journalctl --user -t dns-health-check -f"
    ;;
  uninstall)
    systemctl --user disable --now dns-health-check.timer || true
    rm -f "$BIN_DST" "$SVC_DST" "$TMR_DST"
    systemctl --user daemon-reload
    echo "Uninstalled."
    ;;
  *)
    echo "Usage: $0 [install|uninstall]" >&2
    exit 2
    ;;
esac
