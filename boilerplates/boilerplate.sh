#!/usr/bin/env bash
#------------------------------------------------------------------------------
#
# Shellscript boilerplate
#
#------------------------------------------------------------------------------

set -u
umask 0022
export LC_ALL=C
readonly SCRIPT_NAME=$(basename $0)


#
# Usage
#
usage () {
    cat << __EOS__
Usage:
    ${SCRIPT_NAME} [-h]

Description:
    Shellscript boilerplate.
    https://github.com/mitsu-ksgr/shellscript-boilerplates

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
    echo -n "Error: " 1>&2
    echo $@ 1>&2
    usage
    exit 1
}


#
# Entrypoint
#
main() {
    parse_args $@
    shift `expr $OPTIND - 1`

    echo "Hello shell script world!! $@"

    exit 0
}

main $@
exit 0

