#!/bin/bash
# Open attachment in browser. Works with both:
#   - filename argument (from mailcap %s)
#   - stdin pipe (from neomutt pipe-entry)

tmpdir="/tmp/mutt_attachments_${USER}"
mkdir -p "$tmpdir"

if [ -n "$1" ] && [ -f "$1" ]; then
    # Called from mailcap with filename
    src="$1"
else
    # Called from pipe-entry, read from stdin
    src="$tmpdir/pipe_$(date +%s)_$$.html"
    cat > "$src"
fi

# Copy to unique filename so NeoMutt can't delete it from under us
dest="$tmpdir/$(date +%s)_$(basename "$src")"
cp "$src" "$dest"

setsid ${BROWSER:-chromium} "$dest" &
disown
