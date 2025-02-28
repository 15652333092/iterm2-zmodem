#!/bin/bash

FILE=`osascript -e 'tell application "iTerm" to activate' -e 'tell application "iTerm" to set thefile to choose folder with prompt "Choose a folder to place received files in"' -e "do shell script (\"echo \"&(quoted form of POSIX path of thefile as Unicode text)&\"\")"`
# FILE="/Users/"`whoami`"/Downloads"
if [[ $FILE = "" ]]; then
	echo Cancelled.
	# Send ZModem cancel
	echo -e \\x18\\x18\\x18\\x18\\x18
	sleep 1
	echo
	echo \# Cancelled transfer
else
	echo $FILE
	cd "$FILE"
	/opt/homebrew/bin/rz --rename --escape --binary --bufsize 4096 
	sleep 1
	echo
	echo \# Sent \-\> $FILE
fi
