#!/bin/bash +x

#------------------------------------------------------------------------------
#
# Sample - require run as root user.
#
#------------------------------------------------------------------------------


#
# Constants
#
readonly SCRIPT_NAME=$(basename $0)


#
# Usage
#
usage () {
    cat << __EOS__
Usage:
    sudo ${SCRIPT_NAME} [-h]

Description:
    sample for require run as root.

Options:
    -h  show usage.
__EOS__
}

parse_args() {
    while getopts h flag; do
        case "${flag}" in
            h )
                usage
                exit 0
                ;;
            * )
                usage
                exit 0
                ;;
        esac
    done
}

err() {
    echo "Error: $@" 1>&2
    usage
    exit 1
}


#
# main method
#
main() {
    parse_args $@
    shift `expr $OPTIND - 1`

    # Check root privilege
    if [[ $(/usr/bin/id -u) -ne 0 ]]; then
        err "require root privilege."
    fi

    echo "Root privilege!"
    whoami
    echo "Succeeded!"

    exit 0
}


#
# Entry Point
#
main $@
exit 0

