#!/bin/sh +x

#------------------------------------------------------------------------------
#
# Sample - option values.
#
#------------------------------------------------------------------------------


#
# Constants
#
readonly SCRIPT_NAME=$(basename $0)
readonly DEFAULT_OPTION_VALUE_B=20


#
# Option values
#
OPT_VALUE_A=
OPT_VALUE_B=


#
# Usage
#
usage () {
    cat << __EOS__
Usage:
    ${SCRIPT_NAME} [-h] {[-a] OPTION_VALUE_A} {[-b] OPTION_VALUE_B}

Description:
    sample for option values.

OPTION_VALUE_A:
    required.
    option value A.
    default: ${DEFAULT_OPTION_VALUE_A}

OPTION_VALUE_B:
    option value B.
    default: ${DEFAULT_OPTION_VALUE_B}

Options:
    -h  show usage.
    -a  option value A (required).
    -b  option value B.

__EOS__
}

parse_args() {
    while getopts ha:b: flag; do
        case "${flag}" in
            h )
                usage
                exit 0
                ;;

            a )
                OPT_VALUE_A=${OPTARG}
                ;;

            b )
                OPT_VALUE_B=${OPTARG}
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
    local opt_value_a=
    local opt_value_b=

    parse_args $@
    shift `expr $OPTIND - 1`


    # Check Option A (required)
    if [ -z "${OPT_VALUE_A}" ]; then
        err 'OPTION_VALUE_A is requred'
    else
        opt_value_a=${OPT_VALUE_A}
    fi
    echo "OptionA: ${opt_value_a}"

    # Check Option B
    echo -n 'OptionB: '
    if [ -z "${OPT_VALUE_B}" ]; then
        echo -n '(use default) '
        opt_value_b=${DEFAULT_OPTION_VALUE_B}
    else
        opt_value_b=${OPT_VALUE_B}
    fi
    echo ${opt_value_b}

    exit 0
}


#
# Entry Point
#
main $@
exit 0

