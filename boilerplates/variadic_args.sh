#!/bin/sh +x

#------------------------------------------------------------------------------
#
# Sample - use variadic arguments.
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
    ${SCRIPT_NAME} [-h] arg1 arg2...

Description:
    sample for variadic arguments.

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
    local option_value=

    parse_args $@
    shift `expr $OPTIND - 1`

    if [ $# -le 1 ]; then
        err "args must be speficied two or more."
    fi

    # parse variadic args.
    for arg in $@; do
        # NOTE: if you receive a file path, do an existence check as follows code:
        #if [ ! -f ${arg} ]; then
        #    err "input file not found: ${arg}"
        #fi
        #path=$(readlink -f ${arg})

        echo "Args: ${arg}"
    done

    exit 0
}


#
# Entry Point
#
main $@
exit 0

