#!/bin/bash -x

# taking input three numbers
read -p "Enter first number a : " num1
read -p "Enter second number b : " num2
read -p "Enter third number c : " num3

# compute a+b*c
operation1=`echo "scale=2; $((num1+num2*num3))" | bc`
