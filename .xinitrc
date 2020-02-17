# mouse settings
xinput --set-prop "Logitech G Pro Gaming Mouse" "libinput Accel Speed" -1
xinput --set-prop "Logitech G Pro Gaming Mouse" "Coordinate Transformation Matrix" 2.000000, 0.000000, 0.000000, 0.000000, 2.000000, 0.000000, 0.000000, 0.000000, 1.000000

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

# start dbus for playerctl & spotify, must be started early to allow programs opened by sxhkd to be listed in dbus
# test for an existing bus daemon, just to be safe
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
  # if not found, launch a new one
  eval `dbus-launch --sh-syntax --exit-with-session`
  echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

# keyboard delay & rate
xset r rate 200 60

# swap esc and caps lock
setxkbmap -option caps:swapescape

# start various programs in the background
feh --bg-center pictures/backgrounds/sea-of-clouds.jpg &
# need to kill pulseaudio first and restart so it recognizes all screens
pkill pulseaudio && pulseaudio --start &
compton &
redshift &
sxhkd > /home/sam/.config/sxhkd/sxhkd.log &
~/scripts/set_status.sh &
numlockx on

# fixed for large cursor
xrdb -merge ~/.Xresources

# turn off the screen after 100 seconds
xset dpms 0 0 100


# start window manager
exec dwm
#exec bspwm -c ~/.config/bspwm/bspwmrc
