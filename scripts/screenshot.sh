#!/usr/bin/env sh
# Temporarily disable blur to make selection overlay snappier.
hyprctl keyword decoration:blur:enabled false >/dev/null 2>&1

# Capture selected area to clipboard with a dark non-selected overlay.
grim -g "$(slurp -b 00000066)" - | wl-copy --type image/png
status=$?

# Restore blur after capture/cancel.
hyprctl keyword decoration:blur:enabled true >/dev/null 2>&1
exit "$status"
