#!/usr/bin/env bash
#------------------------------------------------------------------------------
#
# Colored string.
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
    Sample for colored string.

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

colored() {
    local message=${1}
    local color=${2:-}
    case ${color} in
        bk|black    ) echo "\e[30m${message}\e[m" ;;
        r|red       ) echo "\e[31m${message}\e[m" ;;
        g|green     ) echo "\e[32m${message}\e[m" ;;
        y|yellow    ) echo "\e[33m${message}\e[m" ;;
        b|blue      ) echo "\e[34m${message}\e[m" ;;
        m|magenta   ) echo "\e[35m${message}\e[m" ;;
        c|cyan      ) echo "\e[36m${message}\e[m" ;;
        w|white     ) echo "\e[37m${message}\e[m" ;;
        * ) echo "${message}" ;;
    esac
}


#
# Entrypoint
#
main() {
    parse_args $@
    shift `expr $OPTIND - 1`

    echo "----------"

    echo -e "Black  : \e[30mBLACK\e[m"
    echo -e "Red    : \e[31mRED\e[m"
    echo -e "Green  : \e[32mGREEN\e[m"
    echo -e "Yellow : \e[33mYELLOW\e[m"
    echo -e "Blue   : \e[34mBLUE\e[m"
    echo -e "Magenta: \e[35mMAGENTA\e[m"
    echo -e "Cyan   : \e[36mCYAN\e[m"
    echo -e "White  : \e[37mWHITE\e[m"

    echo "----------"

    echo -e "Black  : $(colored 'BLACK' 'black')"
    echo -e "Red    : $(colored 'RED' 'red')"
    echo -e "Green  : $(colored 'GREEN' 'green')"
    echo -e "Yellow : $(colored 'YELLOW' 'yellow')"
    echo -e "Blue   : $(colored 'BLUE' 'blue')"
    echo -e "Magenta: $(colored 'MAGENTA' 'magenta')"
    echo -e "Cyan   : $(colored 'CYAN' 'cyan')"
    echo -e "White  : $(colored 'WHITE' 'white')"

    echo "----------"

    echo -e \
        $(colored 'R' 'r')\
        $(colored 'G' 'g')\
        $(colored 'B' 'b')

    echo -e "$(colored 'Y' 'y')$(colored 'M' 'm')$(colored 'C' 'c')"

    for ch in $(echo "Colorful Life!" | sed -e 's/\(.\)/\1\n/g'); do
        case "$(( $RANDOM % 6 ))" in
            0 ) echo -ne "$(colored $ch 'r')" ;;
            1 ) echo -ne "$(colored $ch 'g')" ;;
            2 ) echo -ne "$(colored $ch 'b')" ;;
            3 ) echo -ne "$(colored $ch 'y')" ;;
            4 ) echo -ne "$(colored $ch 'm')" ;;
            5 ) echo -ne "$(colored $ch 'c')" ;;
        esac
    done
    echo ''

    exit 0
}

main $@
exit 0

