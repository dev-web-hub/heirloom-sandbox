#!/bin/zsh
# progress.sh — draw a 12x12 box progress grid

n=$1
filled="##"
empty=".."
size=12
count=0

for row in $(seq $size -1 1); do
  line=""
  for col in $(seq 1 $size); do
    count=$(( (row-1)*size + col ))
    if [ $count -le $n ]; then
      line="$line$filled "
    else
      line="$line$empty "
    fi
  done
  echo "$line"
done
