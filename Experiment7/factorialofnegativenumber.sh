#!/bin/bash
# factorialofnegativenumber.sh

factorial() {
	num=$1
	if [ $num -lt 0 ]; then
		echo "Error: Factorial of negative number is not defined."
		return
        fi

	fact=1
	for (( i=1; i<=num; i++ ))
	do 
		fact=$((fact * i))
	done
	echo"Factorial of $num is $fact"

}

#Ask user to input
read -p "Enter a number: "
factorial $n
