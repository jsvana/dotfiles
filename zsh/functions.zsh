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
