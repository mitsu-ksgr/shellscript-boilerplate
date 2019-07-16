#!/bin/sh

target=$(basename $1)
shift 1

echo '--------------------'
echo "Target: ${target}"
echo "Args: $@"
echo '--------------------'

fpath="/boilerplates/$target"
if [ -f ${fpath} ]; then
    $fpath $@
else
    echo "error: tagrget not found - ${target}"
fi

exit 0

