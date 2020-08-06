#!/bin/bash
set -u
umask 0022
readonly SCRIPT_NAME=$(basename $0)

to_min() {
    local h=$(echo $1 | sed 's/:.*//g')
    local m=$(echo $1 | sed 's/.*://g')
    echo $(expr $h \* 60 + $m)
}

time_diff() {
    local t1=$(to_min $1)
    local t2=$(to_min $2)
    local diff=

    if [ "$t1" -gt "$t2" ]; then
        diff=$(($t1 - $t2))
    else
        diff=$(($t2 - $t1))
    fi

    h=$(($diff / 60))
    m=$(($diff % 60))
    printf "%02d:%02d\n" $h $m
    return 0
}


if [ -n "${1+$1}" -a -n "${2+$2}" ]; then
    time_diff $@
else
    cat << __EOS__
Usage:
    $SCRIPT_NAME TIME1 TIME2

Synopsis:
    ./$SCRIPT_NAME 10:00 11:00
    > 01:00

    ./$SCRIPT_NAME 18:31 08:03
    > 10:28

Description:
    Calculate the difference between two times.

__EOS__
fi

