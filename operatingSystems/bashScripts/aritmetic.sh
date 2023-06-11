#!/bin/bash

#Z1
echo "========================"
echo "Zad_1"
function f1() {
	if [ $(($1-$2)) == 0 ];then
		echo "BLAD, LICZNIK NIE MOZE ROWANC SIE 0"
		exit -1
	fi
	temp=$((($1+$2)/(($1-$2))))
	echo $temp
}

f1 $1 $2

#Z2
echo "========================"
echo "Zad_2"
function NWDr() {
	a=$1
	b=$2
	if [ $# != 2 ];then
		echo "BLAD, ZLA LICZBA ARGUMENTOW"
		exit -1
	fi

	if [ $b != 0 ];then
		let "c=a%b"
		#echo "c = $c"
		NWDr $b $c
	else
		echo $a
	fi
}

NWDr $1 $2


echo "========================"
echo "Zad_3"
function NWDi() {
	a=$1
	b=$2
	if [ $# != 2 ];then
	        echo "BLAD, ZLA LICZBA ARGUMENTOW"
                exit -1
        fi

	while [ $a -ne $b ]
	do
		if [ $a -gt $b ];then
			let "a=a-b"
		else
			let "b=b-a"

		fi
	done
	echo $a
}

NWDi $1 $2


echo "========================"
echo "Zad_4"
function sum() {
	suma=0
	for i in "$@"
	do
		suma=$(($suma+$i))	
	done
	echo $suma
}

sum $@

