#!/bin/bash
# Update signal-cli-native-bin PKGBUILD to the latest GitHub release and optionally build.
# Usage: ./update.sh [--install]

set -euo pipefail
cd "$(dirname "$0")"

echo "→ Fetching latest release..."
latest=$(curl -sS https://api.github.com/repos/AsamK/signal-cli/releases/latest)
tag=$(echo "$latest" | jq -r .tag_name)
ver="${tag#v}"
echo "   latest: $tag → pkgver=$ver"

echo "→ Updating pkgver..."
sed -i "s/^pkgver=.*/pkgver=$ver/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "→ Computing new checksum..."
url="https://github.com/AsamK/signal-cli/releases/download/$tag/signal-cli-$ver-Linux-native.tar.gz"
sum=$(curl -sSL "$url" | sha256sum | cut -d' ' -f1)
echo "   sha256: $sum"

echo "→ Updating sha256sums..."
escaped_url=$(printf '%s\n' "$url" | sed 's/[\/&]/\\&/g')
sed -i "s|^sha256sums=('.*')|sha256sums=('$sum')|" PKGBUILD

echo "→ Done. pkgver=$ver pkgrel=1"

if [ "${1:-}" = "--install" ]; then
    exec makepkg -si --noconfirm
fi
