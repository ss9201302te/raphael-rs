#!/usr/bin/env bash
# Serves the web version on Windows machines without the MSVC build tools, using the GNU toolchain
# (which ships its own linker and dlltool). Run from Git Bash.
# Usage: ./raphael-gui/serve-web-windows.sh [trunk serve args]

set -euo pipefail

channel=$(sed -n 's/^channel = "\(.*\)"/\1/p' "$(dirname "$0")/../rust-toolchain.toml")
export RUSTUP_TOOLCHAIN="$channel-x86_64-pc-windows-gnu"
rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal -c rust-src -t wasm32-unknown-unknown
export PATH="$(rustc --print sysroot)/lib/rustlib/x86_64-pc-windows-gnu/bin/self-contained:$PATH"

exec "$(dirname "$0")/serve-web.sh" "$@"
