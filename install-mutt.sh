#!/bin/bash
# Setup script for mutt/neomutt config
# Run after: stow mutt

echo "=== Installing mutt-wizard ==="
sudo pacman -S --needed mutt-wizard

echo "=== Installing PIM tools (calendar + contacts) ==="
sudo pacman -S --needed vdirsyncer khal khard

echo "=== Installing extra CLI tools ==="
sudo pacman -S --needed urlscan abook uv

echo "=== Installing Python packages ==="
uv tool install mutt-ics
pip install --user vobject

echo "=== Setting up cron jobs ==="
(crontab -l 2>/dev/null | grep -q "mw -Y") || (crontab -l 2>/dev/null; echo "*/1 * * * * /usr/bin/mw -Y") | crontab -
(crontab -l 2>/dev/null | grep -q "vdirsyncer sync") || (crontab -l 2>/dev/null; echo "*/15 * * * * /usr/bin/vdirsyncer sync") | crontab -

echo ""
echo "=== Stow all dotfiles ==="
echo "  stow mutt vdirsyncer khal khard"
echo ""
echo "=== Create local dirs ==="
echo "  mkdir -p ~/.local/share/khal/calendars ~/.local/share/khard ~/.local/share/vdirsyncer/status"
echo ""
echo "=== Next steps ==="
echo "  1. pass insert nextcloud/thaler.fyi"
echo "  2. mw add (configure email accounts)"
echo "  3. vdirsyncer discover && vdirsyncer sync"
echo "  4. mw -Y (sync mail)"
