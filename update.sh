#!/usr/bin/env bash

hosts="10.0.0.31"
#hosts="10.0.0.41 10.0.0.51"

MASTER1="10.0.0.30"
MASTER2="10.0.0.31"

for h in $hosts; do

  ssh $h "cd source/ezplot ; git pull; make install"

  if [[ "$h" == "${MASTER1}" || "$h" == "${MASTER2}" ]]; then
    make service
  fi

done
