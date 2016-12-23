#!/bin/bash

var=""

if [ $var = "" ]; then
    echo "trifft zu"
else
    echo "nein"
fi


file="file name"
[ -f $file ] && echo "$file is a regular file"
