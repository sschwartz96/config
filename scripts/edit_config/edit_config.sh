#!/bin/bash

choice_file=~/scripts/edit_config/config_list.txt
choices=($(awk '{print $1}' $choice_file))
values=($(awk '{print $2}' $choice_file ))

#chosen=$(awk '{print $1}' $choice_file | dmenu -fn "Fira Code:bold:pixelsize=14" -i -p "Which config file to edit?")
chosen=$(awk '{print $1}' $choice_file | rofi -dmenu -i -p "Which config file to edit?")

counter=0
for i in "${choices[@]}"
do
	if [ "$i" = "$chosen" ]
	then
		file=${values[${counter}]}
		echo $file
		alacritty -e nvim --cmd 'sleep 100m' $file
	fi
	counter=$((counter+1))
done
