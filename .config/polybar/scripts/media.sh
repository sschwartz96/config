#!/bin/bash

media_status=$(playerctl -p playerctld status 2>&1 | tail -1)
#info=$(playerctl -p playerctld metadata --format "{{ title }} - {{ artist }}")

no_players="No player could handle this command"
unknown="Unknown option -playerctld"

if [ "$media_status" == "$no_players" ]; then
	echo "No music"
elif [ "$media_status" == "$unknown"  ]; then
	echo "No music"
elif [ "$media_status" == "Stopped"  ]; then
	echo "Stopped"
elif [ "$media_status" == "Paused"  ]; then
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
fi
