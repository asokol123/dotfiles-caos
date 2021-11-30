#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

cp "./gdb/gef.rc" "$HOME/.gef.rc"
