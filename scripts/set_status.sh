# sleep 3 seconds to wait for pulseaudio to start
sleep 3

# while loop to update every 2 seconds
while true; do
	delim="|"
	string=""

	############### brightness ##############

	brightness=$(xbacklight -get | awk '{print int($1+0.05)}')
	if [ -n "$brightness" ];
	then
		string="${string}  ${brightness}%"
	fi


	############### volume ##############

	volume=$(pulsemixer --get-volume | awk '{print $1}')
	volIcon=" "

	if [ $volume -eq 0 ]
	then
		volIcon=" "
	elif [ $volume -lt 50 ]
	then
		volIcon=" "
	fi

	string="${string} ${delim} $volIcon$volume%"



	############### battery ##############
	FILE=/sys/class/power_supply/BAT0/capacity
	if test -f "$FILE"; then
		bat=$(cat /sys/class/power_supply/BAT0/capacity)
		batIcon="${delim}  "
		if [ $bat -lt 35 ]
		then
			batIcon=" "
		elif [ $bat -lt 70 ]
		then
			batIcon=" "
		elif [ $bat -lt 90 ]
		then
			batIcon=" "
		fi
	fi 

	if test -f "/sys/class/power_supply/BAT0/status"; then
		batStatus=$(cat /sys/class/power_supply/BAT0/status)
		if [ "$batStatus" = "Charging" ]
		then 
			batIcon="${batIcon}+"
		fi
		
		string="${string} ${delim} $batIcon$bat%"
	fi

	############### time&date ##############
	string="${string} ${delim} $(date '+%D %H:%M')"


	xsetroot -name "${string}"

	# sleep for 30 seconds
	sleep 60
done
