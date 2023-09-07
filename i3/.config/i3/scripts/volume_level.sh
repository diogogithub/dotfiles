#!/bin/bash
# Pulse Audio controls

#sink=$(pacmd list-sinks | grep index | awk '{ print substr( $0, length($0), length($0) ) }')
sink=$(pactl list short sinks | grep -F RUNNING | cut -d$'\t' -f1)

# Unmute if updating volume and currently mute
if [ "$( pacmd dump | awk '$1 == "set-sink-mute" {m[$2] = $3} $1 == "set-default-sink" {s = $2} END {print m[s]}')" = 'yes' ]
then
	pactl set-sink-mute "$sink" toggle
fi

case "$1" in
	up)
		pactl set-sink-volume "$sink" +5% #increase sound volume
		;;
	down)
		pactl set-sink-volume "$sink" -5% #decrease sound volume
		;;
        toggle)
                pactl set-sink-mute "$sink" toggle # mute sound volume
                ;;
esac
