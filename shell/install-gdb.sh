#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

bash -c "$(curl -fsSL https://raw.githubusercontent.com/hugsy/gef/master/scripts/gef.sh)" 2>/dev/null

cp "./gdb/gef.rc" "$HOME/.gef.rc"
