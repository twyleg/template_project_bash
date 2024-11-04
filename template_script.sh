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

#
# Functions
#
function print_specific_argument {
	echo "$2"
}


function print_all_arguments {
	echo "$@"
}

function check_if_we_are_root {
	if [ "$(id -u)" -ne 0 ]; then
		echo "Please run as root"
		exit -1
	fi
}

function ignore_all_outputs {
	echo "this is some output on stdout to ignore" > /dev/null
	>&2 echo "this is some output on stderr to ignore" > /dev/null 2>&1
}

function ignore_error {
	cat /this/file/does/not/exist > /dev/null 2>&1 || true
}

function return_non_numerical_value {
	local var="this is a non numerical return value"
	echo $var
}


print_specific_argument foo bar
print_all_arguments "$@"
ignore_all_outputs
ignore_error

return_value=$(return_non_numerical_value)
echo $return_value




