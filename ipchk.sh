#!/bin/sh

# This script display external and internal IP address in two rows
# Depends on `bind-tools`

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

w=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}')
l=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

echo -e  : ${w}"\n" : ${l}


#name="none"

#w=$(dig +short myip.opendns.com @resolver1.opendns.com)
#l=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
#if [[ ! -z "$w$l" ]]; then
#    name="WAN: ${w}"\n"LAN: ${l}"
#fi
#
#if [[ $1 == -N* ]]; then
#    echo "/home/nylar/.config/tint2/tint2-executors/images/refresh.sng: $name"
#elif [[ $1 == -M* ]]; then
#    echo "$(echo $1 | cut -c3-) $name"
#else
#    echo /home/nylar/.config/tint2/tint2-executors/images/network.svg
#    echo -e WAN: ${w}"\n"LAN: ${l}
#fi
