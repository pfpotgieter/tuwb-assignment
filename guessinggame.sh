#!/bin/bash - 
#===============================================================================
#
#          FILE: guessinggame.sh
#
#         USAGE: ./guessinggame.sh 
# 
#   DESCRIPTION: Script to have the user guess the number of files in a directory.
#				 Unsuccessful attempts are reported as being either too high or too low
#				 and the user can try another guess after a short delay. A correct
#				 attempt is acknowledged and the script exits normally.
# 
#        AUTHOR: Ferdie Potgieter (FP), pfpotgieter@csir.co.za
#  ORGANIZATION: CSIR - DPSS
#       CREATED: 03/05/2018 08:37:15
#      REVISION: 1
#===============================================================================

NUMFILES=$(find . -maxdepth 1 -type f | wc -l)
RESPONSE=

check_num () {
	if [[ $1 -gt $NUMFILES ]]; then
		echo "The number you guessed was too high. Try again."
		return 1
	elif [[ $1 -lt $NUMFILES ]]; then
		echo "The number you guessed was too low. Try again."
		return 1
	elif [[ $1 -eq $NUMFILES ]]; then
		echo "Congratuations! You have correctly guessed the number of files."
		return 0
	fi
}	# ----------  end of function check_num  ----------

while [ true ]; do
	clear
	read -p "Guess the number of files in the current directory? > " RESPONSE
	if [[ "$RESPONSE" =~ ^[[:digit:]]+$ ]]; then
		if check_num $RESPONSE; then
			break
		fi
	else
		echo "Invalid number. Try again." >&2
	fi
	sleep 3s
done
exit 0
# end of guessinggame.sh
