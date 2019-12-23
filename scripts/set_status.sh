# while loop to update every 2 seconds
while true; do
	brightness=$(xbacklight -get | awk '{print int($1+0.05)}')

	volume=$(amixer sget Master | awk -F"[][]" '/dB/ { print $2 }')
	volume=$(echo $volume | tr -d %)
	volIcon=" "
	if [ $volume -eq 0 ]
	then
		volIcon=" "
	elif [ $volume -lt 50 ]
	then
		volIcon=" "
	fi


	bat=$(cat /sys/class/power_supply/BAT0/capacity)
	batIcon=" "
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

	batStatus=$(cat /sys/class/power_supply/BAT0/status)
	if [ "$batStatus" = "Charging" ]
	then 
		batIcon="${batIcon}+"
	fi


	xsetroot -name "|  $brightness% | $volIcon$volume% | $batIcon$bat% | $(date '+%D %H:%M')"

	# sleep for 30 seconds
	sleep 60
done
