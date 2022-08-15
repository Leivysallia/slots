#!/bin/bash
set -a

RANDOM=$( date +%N )
SEED=$RANDOM
##	echo "$SEED" > seed.bash
rebet='^[1-8]$'
remulti='^[1-8]$'
rebonus='^[0-1]$'
coin=100
##sign=$( echo -e '\u237C' ) 
coinsign=$( echo -e '\u20A0' )
##coinsign=$'$'
##betsign=$'BET: '
betsign="--BET: "
multisign=$'LINES: '


##betsign=$( echo -e '\u0E3F' )
##multisign=$( echo -e '\u20A5' )
