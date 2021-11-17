#!/bin/bash

if command -v sudo > /dev/null; then
    SUDO="sudo"
else
    SUDO=""
fi

echo "Installing required packages"
${SUDO} apt-get update -y
${SUDO} apt-get install -y vim curl git wget gdb gcc gcc-multilib python3

