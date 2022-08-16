#!/bin/bash
set -a
shopt -s nullglob globstar

coin=10

source alias.bashrc
source functions.bashrc
source vars.bashrc

fif reel

while [[ $coin -gt 0 ]]
do

bet
linkstart
##	debug
calc

echo $''

render

level ${base[@]}
basewin=$win
##echo $basewin
level ${type[@]}
typewin=$win
##echo $typewin
level ${orig[@]}
origwin=$win
##echo $origwin

if [[ $multi -ge 2 ]]
then
level ${zero[@]}
zerowin=$win
##echo $zerowin
level ${one[@]}
onewin=$win
##echo $onewin
level ${two[@]}
twowin=$win
##echo $twowin
fi

if [[ $multi -ge 3 ]]
then
level ${ldiag[@]}
ldiagwin=$win
##echo $ldiagwin
level ${rdiag[@]}
rdiagwin=$win
##echo $rdiagwin
fi

echo $''

payout

source vars.bashrc

done


