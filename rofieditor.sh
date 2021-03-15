#!/usr/bin/env bash
# Rofi menu for quickly editing a file in some directory
# Requires ripgrep
# I use it for editing dotfiles in my ~/.config directory



# this script is particularly useful, running it will present you with a rofi box, asking for a filename, now the current script pulls from $HOME/.config/, but
# you can set it up anyway you'd like.  So the rofi script is going to pull any file you call for within the .config directory.  This was written specifically to
# edit conf files and the like so it does ignore certain file types.  But enter your .conf location into the rofi prompt and it will auto vim edit that file.


# Directory to search in
dir="/home/nylar/configs"
# Ignore files or directories relative to the directory you want to search
ignore="
chromium
enchant
mpv/watch_later
ncmpcpp/lyrics
transmission/torrents
transmission/resume
tint2
Ganache"

ignore_file="/home/nylar/configs/rofi_edit_ignore_file"
# Write ignore file in tmpfs
echo "$ignore" > "$ignore_file"

# Rofi prompt
rofi_prompt="Configuration File Editor"

# Change directory so that the paths are shorter in rofi
cd "$dir" || exit
choice="$(rg --files --color=never --ignore-file "$ignore_file" | rofi -no-disable-history -sort -i -p "$rofi_prompt" -dmenu -fuzzy)"

# If the search is cancelled by the user (e.g. Escape button)
if [[ -z "${choice// }" ]]; then
    exit 1
fi

# Edit the selected file
kitty -e vim "$choice"
