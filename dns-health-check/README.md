# dns-health-check

Lightweight monitor for `systemd-resolved` that detects DNS degradation,
timeout-rate spikes, IPC unresponsiveness, and lookup-latency regressions.
Built to catch and surface recurring issues such as Tailscale MagicDNS EDNS0
flapping, opportunistic DoT failures, and stuck resolver IPC.

## Why
`systemd-resolved` silently downgrades feature sets (EDNS0, DoT, etc.) when
upstream servers misbehave. These downgrades, lookup timeouts, and a wedged
varlink monitor socket can each manifest as "DNS feels slow" without leaving
an obvious signal in the user's face. This monitor turns those silent failure
modes into explicit desktop notifications and journal entries.

## What it checks (every 5 minutes)
1. **IPC responsiveness** — `resolvectl statistics` must return within
   `IPC_TIMEOUT_S` seconds; otherwise a `critical` alert ("resolved may be
   stuck") fires.
2. **Journal degradation messages** — `journalctl -u systemd-resolved` is
   scanned for `Using degraded feature set` lines within the last
   `JOURNAL_LOOKBACK` window. Events are aggregated by server and reported.
3. **Timeout-rate delta** — compares `Total Timeouts / Total Transactions`
   against the previous run. Alerts `critical` if the rate is
   ≥ `TIMEOUT_RATE_PCT_ALERT` over a window of at least
   `MIN_NEW_TX_FOR_RATE` new transactions (avoids noise on idle systems).
4. **Failure-response delta** — any new `Total Failure Responses` triggers
   `critical`.
5. **Live latency probe** — uncached lookup of
   `probe-<nanos>.${PROBE_HOST}` (designed to NXDOMAIN, exercising the full
   resolver path). Alerts `normal` if it takes ≥ `LATENCY_MS_ALERT` ms.

## Files
- `dns-health-check` — the probe script (bash, `set -uo pipefail`).
- `dns-health-check.service` — oneshot user unit invoking the script.
- `dns-health-check.timer` — fires `OnBootSec=2min`, `OnUnitActiveSec=5min`,
  `Persistent=true`.
- `install.sh` — copy-into-place + `systemctl --user enable --now`.

State is persisted at `~/.cache/dns-health-check/state` (sourced as shell
variables on the next run).

## Install
```sh
~/dotfiles/dns-health-check/install.sh
```
Idempotent. Re-running upgrades the script and units in place.

## Uninstall
```sh
~/dotfiles/dns-health-check/install.sh uninstall
```

## Output channels
- **Desktop notifications** via `notify-send` (rendered by `mako`), tagged
  with app name `dns-health-check`. Urgency mirrors severity (`critical` /
  `normal`).
- **Journal** entries tagged `dns-health-check` (via `logger`). View with:
  ```sh
  journalctl --user -t dns-health-check -f          # live tail
  journalctl --user -t dns-health-check --since today
  ```

## Tunables (env vars)
Override in the unit file with `Environment=KEY=VALUE` lines.

| Variable | Default | Purpose |
|---|---|---|
| `TIMEOUT_RATE_PCT_ALERT` | `15` | % of new tx that triggers alert |
| `MIN_NEW_TX_FOR_RATE` | `20` | Min sample size before computing rate |
| `LATENCY_MS_ALERT` | `500` | Latency threshold for probe lookup |
| `PROBE_HOST` | `archlinux.org` | Base host appended to random subdomain |
| `IPC_TIMEOUT_S` | `10` | Max time to wait for `resolvectl statistics` |
| `JOURNAL_LOOKBACK` | `6 minutes ago` | Journal window for degradation scan |
| `STATE_DIR` | `~/.cache/dns-health-check` | Where state file lives |

## Operations cheatsheet
```sh
# Trigger a manual run
systemctl --user start dns-health-check.service

# Live alert feed
journalctl --user -t dns-health-check -f

# Inspect timer schedule
systemctl --user list-timers dns-health-check.timer

# Pause / resume monitoring
systemctl --user disable --now dns-health-check.timer
systemctl --user enable  --now dns-health-check.timer

# Reset baseline state (e.g. after fixing an upstream issue)
rm ~/.cache/dns-health-check/state
```

## Background / context
This monitor was created after a bout of perceived DNS slowness traced to:
- `systemd-resolved` cycling EDNS0 ↔ plain UDP against Tailscale's MagicDNS
  proxy at `100.100.100.100`.
- A wedged `io.systemd.Resolve.Monitor.DumpStatistics` varlink call.
- Opportunistic DoT failures against `1.1.1.1` / `1.0.0.1` (since silenced
  by a `DNSOverTLS=no` drop-in at
  `/etc/systemd/resolved.conf.d/no-opportunistic-dot.conf`).

These are the exact patterns the monitor detects — restoring observability
into the otherwise-silent resolver.
