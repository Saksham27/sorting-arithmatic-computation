#!/bin/bash -x

# initialising a dictionary
declare -A operationResult

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

echo ${operationResult[@]}
