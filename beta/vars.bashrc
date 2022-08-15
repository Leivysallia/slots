#!/bin/bash
set -a

RANDOM=$( date +%N )
SEED=$RANDOM
##	echo "$SEED" > seed.bash

rebet='^[1-8]$'
remulti='^[1-8]$'
rebonus='^[0-1]$'

fourplus=0
zerothrees=0
zerotwos=0
zeroones=0
zerozeros=0



temp=$RANDOM
equal=$RANDOM
wins=0
payout=0
fullbet=$(( RANDOM * 3 ))

##sign=$( echo -e '\u237C' ) 
##coinsign=$( echo -e '\u20A0' )
##betsign=$( echo -e '\u0E3F' )
##multisign=$( echo -e '\u20A5' )

coinsign=$'$'
betsign=$'B: '
multisign=$'M: '

unset base[@]
unset type[@]
unset orig[@]

unset zero[@]
unset one[@]
unset two[@]

unset ldiag[@]
unset rdiag[@]

unset bonus[@]
