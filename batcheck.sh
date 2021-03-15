#!/bin/bash

icon=$(bash /home/nylar/configs/bat.sh)
bat=$(acpi -i && acpi -t)

notify-send -i $icon "$bat"
