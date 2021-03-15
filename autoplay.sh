#!/bin/bash

selection=$(xclip -o -selection -clipboard)
kitty -e mpv $selection
