# keyboard delay & rate
xset r rate 200 60

# set trackpad settings
synclient VertScrollDelta=-66	# natural scrolling
synclient TapAndDragGesture=1
synclient TapButton1=1
synclient TapButton2=3
synclient PalmDetect=1
synclient PalmMinWidth=4
synclient PalmMinZ=50
synclient MinSpeed=1.5
synclient HorizTwoFingerScroll=1

# set background
feh --bg-fill ~/bgs/bg.jpg &

# set brightness
xbacklight =10

# start compton
compton --config ~/.config/compton/compton.conf &

# start redshift (blue light filter)
redshift &

# start simple x hot(k)ey daemon
sxhkd &

# swap esc and caps
setxkbmap -option caps:swapescape

# start syncing the status bar
~/scripts/set_status.sh &

# turn off the screen after 100 seconds
xset dpms 0 0 420

# start dbus for playerctl & spotify
# test for an existing bus daemon, just to be safe
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
  # if not found, launch a new one
  eval `dbus-launch --sh-syntax --exit-with-session`
  echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

# start display manager
exec dwm
#exec bspwm
