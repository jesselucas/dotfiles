#!/bin/sh

i=0
while [ $i -lt 255 ]; do
   i=`expr $i + 1`
   printf "\x1b[38;5;${i}mcolor${i}\x1b[0m\n"
done
