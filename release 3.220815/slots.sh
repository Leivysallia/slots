#!/bin/bash
set -a
shopt -s nullglob globstar

clear

source functions.bashrc
source vars.bashrc

revar

fif seed

while [[ $coin -gt 0 ]]
do

bet
sanity

linkstart
##	debug
calc

echo $''

render

if [[ $multi -ge 1 ]]
then
level ${type[@]}
typewin=$win
##echo $typewin
fi

if [[ $multi -ge 2 ]]
then
level ${base[@]}
basewin=$win
##echo $basewin
fi

if [[ $multi -ge 3 ]]
then
level ${orig[@]}
origwin=$win
##echo $origwin
fi

if [[ $multi -ge 4 ]]
then
level ${zero[@]}
zerowin=$win
##echo $zerowin
fi

if [[ $multi -ge 5 ]]
then
level ${one[@]}
onewin=$win
##echo $onewin
fi

if [[ $multi -ge 6 ]]
then
level ${two[@]}
twowin=$win
##echo $twowin
fi

if [[ $multi -ge 7 ]]
then
level ${ldiag[@]}
ldiagwin=$win
##echo $ldiagwin
fi

if [[ $multi -eq 8 ]]
then
level ${rdiag[@]}
rdiagwin=$win
##echo $rdiagwin
fi

echo $''

bonus ${bonus[@]}

payout

revar

spacer

done


