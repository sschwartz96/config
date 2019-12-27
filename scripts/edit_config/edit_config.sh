#!/bin/bash

choice_file=~/scripts/edit_config/config_list.txt
choices=($(awk '{print $1}' $choice_file))
values=($(awk '{print $2}' $choice_file ))

chosen=$(awk '{print $1}' $choice_file | dmenu -i -p "Which config file to edit?")

counter=0
for i in "${choices[@]}"
do
	if [ "$i" = "$chosen" ]
	then
		file=${values[${counter}]}
		echo $file
		st nvim $file
	fi
	counter=$((counter+1))
done
