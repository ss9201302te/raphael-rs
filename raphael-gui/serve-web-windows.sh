#!/usr/bin/env bash
# Windows version of serve-web.sh. Run from Git Bash.
# Usage: ./raphael-gui/serve-web-windows.sh [trunk serve args]

set -euo pipefail
source "$(dirname "$0")/windows-env.sh"
exec "$(dirname "$0")/serve-web.sh" "$@"
