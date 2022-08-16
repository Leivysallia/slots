#!/bin/bash

set -a

mvf () {

mv -fv

}

fif () {

if [[ ! -d bkup ]]
then
mkdir bkup
fi

if [[ -f $1.bash ]]
then
mv -fv $1.bash bkup/$1.bkup
fi

}

render () {

echo "$coinsign$coin"
echo "$betsign$bet"
echo "$multisign$multi"
echo $''

}

bet () {

rebet='^[1-5]$'
remulti='^[1-3]$'

echo "$coinsign$coin"
echo $''
echo $''

read -n1 -r -p "BET? [1-5]: " bet
echo $''
until [[ "$bet" =~ $rebet ]]
do
read -n1 -r -p "BET? [1-5]: " bet
echo $''
done

read -n1 -r -p "MULTI? [1-3]: " multi
echo $''
until [[ "$multi" =~ $remulti ]]
do
read -n1 -r -p "MULTI? [1-3]: " multi
echo $''
done

clear

}

linkstart () {

##sever=$(( (multi * 3) + 3 ))
sever=9


base[0]=$( shuf -r -i 0-$sever -n1 )
base[1]=$( shuf -r -i 0-$sever -n1 )
base[2]=$( shuf -r -i 0-$sever -n1 )

type[0]=$( shuf -r -i 0-$sever -n1 )
type[1]=$( shuf -r -i 0-$sever -n1 )
type[2]=$( shuf -r -i 0-$sever -n1 )

orig[0]=$( shuf -r -i 0-$sever -n1 )
orig[1]=$( shuf -r -i 0-$sever -n1 )
orig[2]=$( shuf -r -i 0-$sever -n1 )

echo ${base[@]}
echo ${type[@]}
echo ${orig[@]}

}

debug () {

base[0]=$( shuf -r -i 0-2 -n1 )
base[1]=$( shuf -r -i 0-2 -n1 )
base[2]=$( shuf -r -i 0-2 -n1 )

type[0]=$( shuf -r -i 0-2 -n1 )
type[1]=$( shuf -r -i 0-2 -n1 )
type[2]=$( shuf -r -i 0-2 -n1 )

orig[0]=$( shuf -r -i 0-2 -n1 )
orig[1]=$( shuf -r -i 0-2 -n1 )
orig[2]=$( shuf -r -i 0-2 -n1 )


echo ${base[@]} |tee -a reel.bash
echo ${type[@]} |tee -a reel.bash
echo ${orig[@]} |tee -a reel.bash

}


calc () {

temp=$(printf ${base[0]})
zero[0]=$temp
temp=$(printf ${type[0]})
zero[1]=$temp
temp=$(printf ${orig[0]})
zero[2]=$temp

temp=$(printf ${base[1]})
one[0]=$temp
temp=$(printf ${type[1]})
one[1]=$temp
temp=$(printf ${orig[1]})
one[2]=$temp

temp=$(printf ${base[2]})
two[0]=$temp
temp=$(printf ${type[2]})
two[1]=$temp
temp=$(printf ${orig[2]})
two[2]=$temp

temp=$(printf ${base[0]})
ldiag[0]=$temp
temp=$(printf ${type[1]})
ldiag[1]=$temp
temp=$(printf ${orig[2]})
ldiag[2]=$temp

temp=$(printf ${base[2]})
rdiag[0]=$temp
temp=$(printf ${type[1]})
rdiag[1]=$temp
temp=$(printf ${orig[0]})
rdiag[2]=$temp

}

level () {

level=("$@")
win=177013
##echo "${level[@]}"

watermark=${level[0]}
##echo ""$watermark":ZERO"
if [[ $watermark -eq 0 ]]
then
watermark=${level[1]}
##echo ""$watermark":ONE"
if [[ $watermark -eq 0 ]]
then
watermark=${level[2]}
##echo ""$watermark":TWO"
equal=1
fi
fi
if [[ $watermark -ne 0 ]]
then
if [[ $equal -ne 1 ]]
then
for iter in "${level[@]}"
do

##	echo ""$iter":ITER"

	if [[ $iter -ne 0 ]]
    then
    if [[ $watermark -ne $iter ]]
    then
    	equal=0
    	break
    fi
	fi

	if [[ $iter -ne 0 ]]
    then
    if [[ $watermark -eq $iter ]]
    then
    	equal=1
    fi
	fi
done
fi
fi

##echo $equal

if [[ $equal -eq 0 ]]
then 
echo "LOSE"
win=0
else
echo "WIN"
win=1
wins=$(( wins + 1 ))
fi

equal=177013

}

payout () {

payout=$(( ( bet * ( wins / 2 ) ) ))

if [[ $payout -eq 0 ]]
then
	payout=$(( bet * -1 ))
	display=$(( payout / -1 ))
	echo "You Lost $coinsign$display"
fi

if [[ $payout -gt 0 ]]
then
	echo "You Won $coinsign$payout"
fi

echo $''

coin=$(( coin + payout ))

render

}

