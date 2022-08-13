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

echo "${level[@]}"

for iter in "${level[@]}"
do

	echo ""$iter":ITER"

	if [[ $iter -eq 0 ]]
    then
        zeros=$(( zeros + 1 ))
    fi

done

echo $zeros

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

coin=$(( coin - fullbet ))
payout=$(( ( bet * ( wins ) ) ))
coin=$(( coin + payout ))

echo "You Won $coinsign$payout"

echo $''

render

}

