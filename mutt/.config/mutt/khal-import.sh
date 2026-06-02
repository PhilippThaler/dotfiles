#!/bin/bash
# Import calendar invite from stdin into khal
tmp=$(mktemp /tmp/neomutt_ics_XXXXXX.ics)
cat > "$tmp"
khal import --batch "$tmp"
rm -f "$tmp"
