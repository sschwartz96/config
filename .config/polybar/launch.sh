#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
polybar top >>/dev/null & disown
polybar bottom >>/dev/null & disown

echo "Bars launched..."
