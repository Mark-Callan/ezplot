#!/usr/bin/env bash

hosts="10.0.0.31 10.0.0.41"
#hosts="10.0.0.51"

for h in $hosts; do

  ssh $h "cd source/ezplot ; git pull; make install ;" 

done

