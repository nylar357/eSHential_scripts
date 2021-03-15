#!/bin/bash

curl -s  wttr.in/greenville 2>/dev/null | sed -l 2 -n '3,7{s/\d87\[[0-9;]*m//g;s/^..//;s/ *$//;p}'
