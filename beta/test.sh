#!/bin/bash
set -a
shopt -s nullglob globstar

clear

fours=0
threes=0
twos=0
ones=0
zer0s=0
coin=100
zeros=0


for test in {1..100}
do

source functions.bashrc
source vars.bashrc

linkstart
##	debug
calc

bonus ${bonus[@]}

if [[ $zeros -ge 4 ]]
then
	fourplus=$(( fourplus + 1 ))
fi

if [[ $zeros -eq 3 ]]
then
	zerothrees=$(( zerothrees + 1 ))
fi

if [[ $zeros -eq 2 ]]
then
	zerotwos=$(( zerotwos + 1 ))
fi

if [[ $zeros -eq 1 ]]
then
	zeroones=$(( zeroones + 1 ))
fi

if [[ $zeros -eq 0 ]]
then
	zerozeros=$(( zerozeros + 1 ))
fi

fours=$(( fourplus + fours ))
threes=$(( zerothrees + threes ))
twos=$(( zerotwos + twos ))
ones=$(( zeroones + ones ))
zer0s=$(( zerozeros + zer0s ))


done

echo "FOUR+: $fours
THREE: $threes
TWO: $twos
ONE: $ones
ZERO: $zer0s" |tee testlog.bash
