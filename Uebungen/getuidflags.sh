#!/bin/bash

dateiname="specialflags_$(date +%F).txt"

find / -type f -perm -2000 -o -type f -perm -4000 -o -type f -perm -1000 | xargs -r ls -la >> "$dateiname"

cat "$dateiname"