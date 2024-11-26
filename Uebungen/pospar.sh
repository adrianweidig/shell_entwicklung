#!/bin/sh

echo "Es wurden $# PosParameter übergeben"

for item in $(seq 0 $#); do
    eval wert=\$$item
    echo "$item ist : $wert"
done
