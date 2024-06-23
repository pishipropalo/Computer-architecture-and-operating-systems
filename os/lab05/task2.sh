#!/bin/bash

sum() {
  s=0
  for num in "$@"; do
    s2=$(expr $s + $num 2>/dev/null) || return 0
  s=$s2
  done
  echo $s
}

read -a n1
read -a n2

res1=$(sum "${n1[@]}")
res2=$(sum "${n2[@]}")

[ $res1 -eq $res2 ] && echo "Equal" || echo "Not equal"
