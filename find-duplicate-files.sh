#!/bin/bash
#============================================================================
# Simple bash script to find files with same in a dir.
# **Use with caution as there is no error checking (TBD).**
#============================================================================

find . -name "*.h" -o -name "*.cpp" -type f | 
while read vo
do
  echo `basename "$vo"`
done | awk '{arr[$0]++; next} END{for (i in arr){if(arr[i]>1){print i}}}'
