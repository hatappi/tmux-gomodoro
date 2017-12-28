#!/usr/bin/env bash

if hash gomodoro 2>/dev/null; then
  echo -n `gomodoro remain -i`
else
  echo -n "--:--"
fi
