. ~/.zsh/colors.zsh

function c() {
	cd $PROJECTS/$1
}

function chrome() {
	open "/Applications/Google Chrome.app" $1
}

function qc() {
	python -c "from math import *; print $1" | pbcopy
	pbpaste
}

function battery() {
	if [[ `uname -s` == "Darwin" ]]
	then
		local percent=$(ioreg -n AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; print (max>0? 100*c["\"CurrentCapacity\""]/max: "?")}' | sed -E 's/(^[0-9]+).*/\1/')
		if [[ "${percent}" -lt 15 ]]
		then
			batt="${fg_red}${percent}${at_normal}"
		elif [[ "${percent}" -lt 50 ]]
		then
			batt="${fg_yellow}${percent}${at_normal}"
		elif [[ "${percent}" -lt 96 ]]
		then
			batt="${fg_green}${percent}${at_normal}"
		else
			batt=""
		fi
		if [[ -n "$percent" ]]
		then
			echo "$percent%%"
		fi
	elif which acpi &> /dev/null
	then
		local state=$(acpi -b)
		local percent=$(echo ${state[(w)4]} | sed -r 's/(^[0-9]+).*/\1/')
		if [[ "${percent}" -lt 15 ]]
		then
			batt="${fg_red}${percent}${at_normal}"
		elif [[ "${percent}" -lt 50 ]]
		then
			batt="${fg_yellow}${percent}${at_normal}"
		elif [[ "${percent}" -lt 96 ]]
		then
			batt="${fg_green}${percent}${at_normal}"
		else
			batt=""
		fi
		if [[ -n "${percent}" ]]
		then
			echo "${percent}%%"
		fi
	fi
}
