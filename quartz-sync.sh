#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if ! command -v npx >/dev/null 2>&1; then
  echo "[Error] npx not found. Please install Node.js first."
  exit 1
fi

echo "Running: npx quartz sync"
npx quartz sync "$@"

echo "Sync completed."

if [[ -t 0 ]]; then
  printf "\nPress Enter to exit..."
  read -r _
fi
