#!/bin/sh -

# This is a _very_ simplified version of the actual `bootstrap-salt.sh` file
# available at <https://github.com/saltstack/salt-bootstrap>.  Downloading the
# default version every time the machine is booted seems like overkill and
# inconvenient when working in trains/on planes, so this stripped down version
# is used instead.

set -e

_TEMP_CONFIG_DIR="null"

while getopts "c:CF" opt
do
    case "${opt}" in
        c ) _TEMP_CONFIG_DIR="$OPTARG" ;;
        C ) echo "Note: ignoring option '-C'" ;;
        F ) echo "Note: ignoring option '-F'" ;;
        \? ) echo "Option does not exist: $OPTARG" && exit 1 ;;
    esac
done
shift $((OPTIND-1))

# Copy salt config files to the correct directory
mv ${_TEMP_CONFIG_DIR}/minion /etc/salt/minion

# Restart the salt minon service
service salt-minion restart

exit 0
