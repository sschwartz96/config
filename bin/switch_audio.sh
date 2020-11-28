#!/bin/zsh

newSink=$1

# move all playing audio over
pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo "moving stream $streamId"
    pactl move-sink-input "$streamId" "$newSink"
done

# set the default sink
pactl set-default-sink $newSink
