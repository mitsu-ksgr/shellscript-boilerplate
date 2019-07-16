#!/bin/sh +x

#------------------------------------------------------------------------------
#
# Sample - temporary directory.
#
#------------------------------------------------------------------------------


#
# Constants
#
readonly SCRIPT_NAME=$(basename $0)


#
# Prepare temp dir
#
unset TMP_DIR
on_exit() {
    [[ -n "${TMP_DIR}" ]] && rm -rf "${TMP_DIR}";
}
trap on_exit EXIT
trap 'trap - EXIT; on_exit; exit -1' INT PIPE TERM
readonly TMP_DIR=$(mktemp -d "/tmp/${SCRIPT_NAME}.tmp.XXXXXX")


#
# Usage
#
usage () {
    cat << __EOS__
Usage:
    ${SCRIPT_NAME} [-h] arg1 arg2...

Description:
    sample for temporary directory.

Options:
    -h  show usage.

__EOS__
}

parse_args() {
    while getopts ho: flag; do
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
    local output_path=${TMP_DIR}/output.txt

    parse_args $@
    shift `expr $OPTIND - 1`

    if [ $# -eq 0 ]; then
        echo "Number of arguments: nothing" >> ${output_path}
    else
        echo "Number of arguments: $#" >> ${output_path}
        for arg in $@; do
            echo "Args: ${arg}" >> ${output_path}
        done
    fi

    echo "Template dir path: ${TMP_DIR}"
    ls -l ${TMP_DIR}
    echo "##### cat ${output_path} #####"
    cat ${output_path}

    exit 0
}


#
# Entry Point
#
main $@
exit 0

