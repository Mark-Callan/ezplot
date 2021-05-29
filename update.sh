#!/usr/bin/env bash

hosts="10.0.0.31 10.0.0.41 10.0.0.51"

for h in $hosts; do

  echo $h
  ssh -A -X $h "cd source/ezplot ; git pull ; make install ;"

done

