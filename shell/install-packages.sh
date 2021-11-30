#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
    # script cleanup here
}

if command -v sudo > /dev/null; then
    SUDO="sudo"
else
    SUDO=""
fi

echo "Installing required packages"

if command -v apt-get > /dev/null; then
    ${SUDO} apt-get update -y
    ${SUDO} apt-get install -y vim curl git wget gdb gcc gcc-multilib python3
elif command -v pacman > /dev/null; then
    ${SUDO} pacman -Sy --noconfirm --needed vim curl git wget gdb gcc python3
else
    echo "Failed to install packages. Please install manually: vim curl git wget gdb gcc gcc-multilib python3"
    echo "Continue? [Y/n]"
    while true; do
        read -p "Continue? [Y/n]" yn
        case $yn in
            [Nn]* ) exit 1 ;;
        esac
    done
fi

