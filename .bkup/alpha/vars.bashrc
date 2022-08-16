#!/bin/bash
set -a

RANDOM=$( date +%N )

temp=$RANDOM
equal=$RANDOM
wins=1
payout=0

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
