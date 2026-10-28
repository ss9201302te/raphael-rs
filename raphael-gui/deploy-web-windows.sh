#!/usr/bin/env bash
# Builds the web version and deploys it to Cloudflare Pages. Run from Git Bash.
# Requires a prior `npx wrangler login`.
# Usage: ./raphael-gui/deploy-web-windows.sh [cloudflare pages project name]

set -euo pipefail
project="${1:-xiv-craft-ss}"
source "$(dirname "$0")/windows-env.sh"
"$(dirname "$0")/build-web.sh"
cd "$(dirname "$0")/.."
npx --yes wrangler pages deploy distrib --project-name "$project" --branch main --commit-dirty=true
