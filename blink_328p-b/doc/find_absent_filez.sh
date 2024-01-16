#!/bin/sh

echo
echo " files that git does not have checked in:"
echo
for index in \
    `find -maxdepth 1 -type f`
    do
        THE_COMMAND="  git ls-files --error-unmatch  ${index}"
        if ${THE_COMMAND} > /dev/null 2>&1 ; then echo -n ''; else echo "    ${index} not found"; fi
    done
    echo

exit 0

# echo "xx${index}yy"

# Tue 16 Jan 03:30:49 UTC 2024

# end.
