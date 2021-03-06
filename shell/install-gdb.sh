#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
data_dir=${script_dir}/..

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

bash -c "$(curl -fsSL https://raw.githubusercontent.com/hugsy/gef/master/scripts/gef.sh)" 2>/dev/null

cp "${data_dir}/gdb/gef.rc" "$HOME/.gef.rc"
