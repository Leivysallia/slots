#!/bin/bash
set -a

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

revar () {

equal=0
fourplus=0
fours=0
fullbet=0
ones=0
payout=0
temp=0
threes=0
twos=0
wins=0
zer0s=0
zeroones=0
zeros=0
zerothrees=0
zerotwos=0
zerozeros=0

unset base[@]
unset bonus[@]
unset ldiag[@]
unset one[@]
unset orig[@]
unset rdiag[@]
unset two[@]
unset type[@]
unset zero[@]

}

render () {

echo "$coinsign$coin"
echo "$betsign$bet"
echo "$multisign$multi"
echo $''

}

bet () {

echo "$coinsign$coin"
echo $''
echo $''

read -n1 -r -p "BET? [1-8]: " bet
echo $''
until [[ "$bet" =~ $rebet ]]
do
read -n1 -r -p "BET? [1-8]: " bet
echo $''
done

read -n1 -r -p "LINES? [1-8]: " multi
echo $''
until [[ "$multi" =~ $remulti ]]
do
read -n1 -r -p "LINES? [1-8]: " multi
echo $''
done

fullbet=$(( bet * multi ))

clear

}

sanity () {

clear

until [[ $fullbet -le $coin ]]
do

echo "BET:$fullbet"
echo "Insufficent Coin..."

bet

done

}

linkstart () {

##sever=$(( (multi * 3) + 3 ))
sever=9

base[0]=$(( $RANDOM % 10 ))
base[1]=$(( $RANDOM % 10 ))
base[2]=$(( $RANDOM % 10 ))

type[0]=$(( $RANDOM % 10 ))
type[1]=$(( $RANDOM % 10 ))
type[2]=$(( $RANDOM % 10 ))

orig[0]=$(( $RANDOM % 10 ))
orig[1]=$(( $RANDOM % 10 ))
orig[2]=$(( $RANDOM % 10 ))


echo ${base[@]}
echo ${type[@]}
echo ${orig[@]}

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

temp=$(printf ${base[0]})
bonus[0]=$temp
temp=$(printf ${base[1]})
bonus[1]=$temp
temp=$(printf ${base[2]})
bonus[2]=$temp

temp=$(printf ${type[0]})
bonus[3]=$temp
temp=$(printf ${type[1]})
bonus[4]=$temp
temp=$(printf ${type[2]})
bonus[5]=$temp

temp=$(printf ${orig[0]})
bonus[6]=$temp
temp=$(printf ${orig[1]})
bonus[7]=$temp
temp=$(printf ${orig[2]})
bonus[8]=$temp

}

bonus () {

zeros=0
level=("$@")

##  echo "${level[@]}"

for iter in "${level[@]}"
do

	## echo ""$iter":ITER"

	if [[ $iter -eq 0 ]]
    then
        zeros=$(( zeros + 1 ))
    fi

done

##  echo $zeros

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

bonusround () {

if [[ $zeros -ge 1 ]]
then

read -n1 -r -p "SKIP[0]:PLAY[1] " bonusplay
echo $''
read -n1 -r -p "EVEN[0]:ODD[1] " isbonus
echo $''

until [[ "$isbonus" =~ $rebonus ]]
do
read -n1 -r -p "EVEN[0]:ODD[1] " isbonus
echo $''
done

bonusvar=$(( RANDOM % 2 ))

if [[ $isbonus -eq $bonusvar ]]
then
    payout=$(( payout * 2 ))
else
    payout=0
    echo "You Lose..."
    echo $''
fi

fi

}

payout () {

coin=$(( coin - fullbet ))
payout=$(( ( bet * ( wins ) ) ))

echo "PAYOUT: $coinsign$payout"

if [[ $payout -gt 0 ]]
then
bonusround
fi

coin=$(( coin + payout ))

if [[ $payout -gt 0 ]]
then
echo "You Won $coinsign$payout"
fi

echo $''

render

}

spacer () {

echo "---------------------------"
echo $''

}