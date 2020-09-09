#!/bin/bash

media_status=$(playerctl -playerctld status 2>&1 | tail -1)
no_players="No player could handle this command"

if [ "$media_status" == "$no_players" ]; then
	echo
elif [ "$media_status" == "Stopped"  ]; then
	echo "Stopped"
elif [ "$media_status" == "Paused"  ]; then
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
fi
