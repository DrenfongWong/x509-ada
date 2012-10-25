#!/bin/bash
#
# Generate random data.
#
file=/tmp/data
if [ "$1" != "" ]
then
    file=$1
fi

n=$RANDOM

dd if=/dev/urandom of=$file bs=$n count=1 2>/dev/null
