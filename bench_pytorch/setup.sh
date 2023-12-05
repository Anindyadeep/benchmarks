#!/bin/bash

################################################################################
# Script: setup.sh <DEVICE>
# Description: Automates the setup of a virtual environment and installs project
# requirements.
################################################################################

set -euo pipefail

# Main script starts here.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <DEVICE>"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/venv"

if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
    echo "Virtual environment '$VENV_DIR' created."
    # shellcheck disable=SC1091
    source "$VENV_DIR/bin/activate"
    pip install --upgrade pip > /dev/null
    pip install -r "$SCRIPT_DIR/requirements.txt" --no-cache-dir > /dev/null
else
    # shellcheck disable=SC1091
    source "$VENV_DIR/bin/activate"
fi