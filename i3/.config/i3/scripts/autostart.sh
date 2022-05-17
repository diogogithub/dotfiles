#!/bin/zsh
grep -rh Exec ~/.config/autostart | while read -r line ; do 
   ${line:5} &
done
# Fix snap
xhost +si:localuser:$USER
