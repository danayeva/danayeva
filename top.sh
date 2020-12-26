#! /bin/bash

total_bytes=$(cut -d ' ' -f10,12 $2 | sed "s/\"//" | sort | awk '{arr[$2]+=$1} END {for (i in arr) {print i,arr[i]}}'sort | uniq | sort -k 2 -n -r | head -$1 | awk '{sum_bytes+=$2} END {print sum_bytes}')

echo "$(cut -d ' ' -f10,12 $2 | sed "s/\"//" | sort | awk '{arr[$2]+=$1} END {for (i in arr) {print i,arr[i]}}'sort | uniq | sort -k 2 -n -r | head -$1 | \
         awk '{ printf(NR ". %s - %d - %.1f%%\n", $1, $2, $2 / '"$total_bytes"' * 100) }')"
