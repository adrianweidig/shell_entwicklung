#!/bin/bash
for ((i=1; i<=100; i++)) {
    echo $i
    echo "# $((i))%"
    sleep 0.5
} | yad --progress \
  --text="Progress demo..." \
  --width=300 \
  --button=yad-cancel \
  --auto-kill