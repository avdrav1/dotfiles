#!/bin/bash
# Waybar media module: uses playerctl metadata when available,
# falls back to Hyprland window title for players like nugs.net
# that don't expose track info via MPRIS.

player=$(playerctl -l 2>/dev/null | head -1)
if [ -z "$player" ]; then
    echo ""
    exit 0
fi

status=$(playerctl -p "$player" status 2>/dev/null)
if [ -z "$status" ] || [ "$status" = "Stopped" ]; then
    echo ""
    exit 0
fi

title=$(playerctl -p "$player" metadata title 2>/dev/null)
artist=$(playerctl -p "$player" metadata artist 2>/dev/null)

if [ -n "$title" ]; then
    text="$title"
    [ -n "$artist" ] && text="$title - $artist"
else
    # No MPRIS metadata — try Hyprland window title
    if [[ "$player" == chromium* ]]; then
        text=$(hyprctl clients -j | jq -r '.[] | select(.class == "chromium") | .title' 2>/dev/null \
            | grep -iE 'nugs|music|player|audio|listen|stream' \
            | head -1 \
            | sed 's/ - Chromium$//')
        [ -z "$text" ] && text="Chromium"
    else
        text="${player%%.*}"
    fi
fi

# Player icon
if [[ "$player" == chromium* ]]; then
    icon=""
elif [[ "$player" == spotify* ]]; then
    icon=""
else
    icon="󰎆"
fi

# Status icon
case "$status" in
    Playing) status_icon="󰏤" ;;
    Paused)  status_icon="󰐊" ;;
    *)       status_icon="󰓛" ;;
esac

# Truncate long text
if [ ${#text} -gt 35 ]; then
    text="${text:0:32}..."
fi

echo "$icon $status_icon $text"
