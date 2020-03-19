#!/bin/bash -x

# variables
arrLength=0

# initialising a dictionary
declare -A operationResult

# initialising an array
declare -a resultArray

# fucntion to sort the results in descending order
# param 1 : array which you want to sort
function sortDescending() {

	# local constant
	TRUE=1

	# local variables
	local tempArray=("$@")

	for (( i=0; i<$(( ${#tempArray[@]}-1 )); i++ ))
	do
		for (( j=0; j<$(( ${#tempArray[@]}-1-$i )); j++ ))
		do
			if [ $(echo "${tempArray[$j]} <= ${tempArray[$j+1]}" | bc -l) -eq $TRUE ]
			then
				temp=${tempArray[$j]}
				tempArray[$j]=${tempArray[$j+1]}
				tempArray[$j+1]=$temp
			fi
		done
	done

	echo "Sorted in Descending order :  ${tempArray[@]}"
}

# fucntion to sort the results in ascending order
# param 1 : array which you want to sort
function sortAscending() {

	# local constant
	TRUE=1

	# local variables
	local tempArray=("$@")

	for (( i=0; i<$(( ${#tempArray[@]}-1 )); i++ ))
	do
		for (( j=0; j<$(( ${#tempArray[@]}-1-$i )); j++ ))
		do
			if [ $(echo "${tempArray[$j]} >= ${tempArray[$j+1]}" | bc -l) -eq $TRUE ]
			then
				temp=${tempArray[$j]}
				tempArray[$j]=${tempArray[$j+1]}
				tempArray[$j+1]=$temp
			fi
		done
	done

	echo "Sorted in Ascending order :  ${tempArray[@]}"
}

# taking input three numbers
read -p "Enter first number a : " num1
read -p "Enter second number b : " num2
read -p "Enter third number c : " num3

# compute a+b*c
operation1=`echo "scale=2; $((num1+num2*num3))" | bc`
operationResult["a+b*c"]=$operation1 # storing in dictionary

# compute a*b+c
operation2=`echo "scale=2; $((num1*num2+num3))" | bc`
operationResult["a*b+c"]=$operation2 # storing in dictionary

# compute c+a/b
operation3=`echo "scale=2; ($num3+$num1/$num2)" | bc`
operationResult["c+a/b"]=$operation3 # storing in dictionary

# compute a%b+c
operation4=`echo "scale=2; $((num1%num2+num3))" | bc`
operationResult["a%b+c"]=$operation4 # storing in dictionary

for var in ${operationResult[@]} # reading the values from dictioanry and storing them in array
do
	resultArray[$arrLength]=$var
	(( arrLength++ ))
done

echo "Value array : ${resultArray[@]}"

sortDescending ${resultArray[@]}

sortAscending ${resultArray[@]}
