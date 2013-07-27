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
		local BATTPERCENT=$(ioreg -n AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; print (max>0? 100*c["\"CurrentCapacity\""]/max: "?")}' | sed -E 's/(^[0-9]+).*/\1/')
		local PR_BATTERY="asdf"
		if [[ "${BATTPERCENT}" -lt 15 ]]
		then
			PR_BATTERY="${fg_red} ${BATTPRCNT}${at_normal}"
		elif [[ "${BATTPERCENT}" -lt 50 ]]
		then
			PR_BATTERY="${fg_yellow} ${BATTPRCNT}${at_normal}"
		elif [[ "${BATTPERCENT}" -lt 96 ]]
		then
			PR_BATTERY="${fg_green} ${BATTPRCNT}${at_normal}"
		else
			PR_BATTERY="foobar"
		fi
		print "$PR_BATTERY"
	elif which acpi &> /dev/null
	then
		local BATTSTATE="$(acpi -b)"
		local BATTPRCNT="$(echo ${BATTSTATE[(w)4]} | sed -r 's/(^[0-9]+).*/\1/')"
		if [[ -z "${BATTPRCNT}" ]]
		then
			PR_BATTERY=""
		elif [[ "${BATTPRCNT}" -lt 15 ]]
		then
			PR_BATTERY="${PR_BOLD_RED} batt:${BATTPRCNT}%%"
		elif [[ "${BATTPRCNT}" -lt 50 ]]
		then
			PR_BATTERY="${PR_BOLD_YELLOW} batt:${BATTPRCNT}%%"
		elif [[ "${BATTPRCNT}" -lt 96 ]]
		then
			PR_BATTERY=" batt:${BATTPRCNT}%%"
		else
			PR_BATTERY=""
		fi
		echo $PR_BATTERY
	else
		echo ""
	fi
}
