FOUR+: 0
THREE: 3
TWO: 20
ONE: 43
ZERO: 34

bonusround () {

if [[ $zeros -ge 1 ]]
then

read -n1 -r -p "SKIP[0]:PLAY[1] " bonusplay
read -n1 -r -p "EVEN[0]:ODD[1] " isbonus

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
	echo "You Lose..."
fi

fi

}