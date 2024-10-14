#!/usr/bin/env bash

#
# Example:
#  DEBUG=1 bash template_script.sh
#


# When in DEBUG mode, enable a shell mode where all executed commands are printed to the terminal
[ "$DEBUG" == 1 ] && set -x

# Exit on command error
set -e

# Get the dir of the currently running scripts
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
