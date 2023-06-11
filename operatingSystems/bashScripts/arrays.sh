#!/bin/bash

#Z1
function b_sort() {
	((licz=$#))
	tablica=($@)
	#echo $licz
	#echo ${tablica[*]}
	
	for ((i=1; i<$licz; i++));do
		for ((j= $(($licz-1)); $j>=$i; j--));do
			if [ ${tablica[j-1]} -gt ${tablica[j]} ];then
				temp=${tablica[j-1]}
				tablica[(($j-1))]=${tablica[$j]}
				tablica[$j]=$temp
			fi
		done
	done
	
	echo "${tablica[*]}"
}

b_sort $@

echo "================================"

#Z2
function tab_mno() {
	declare -A tab
	wie=$1
	kol=$2
	
	for ((w=1; w<=wie; w++));do
		for ((k=1; k<=kol; k++));do
			let temp=w*k
			#echo "temp = $temp"
			tab[$w, $k]=$temp
			#echo "${tab[$w, $k]}"
		done
	done
	
	x="%$((${#wie}+1))s"
	y=" %9s"
	
	printf "$x" ''
	for ((i=1;i<=wie;i++));do
		printf "$y" $i
	done
	echo
	
	for((w=1; w<=wie; w++));do
		printf "$x" $w
		for((k=1; k<=kol; k++));do
			printf "$y" "${tab[$w, $k]}"
		done
		echo
	done
}

tab_mno $1 $2

echo "============================"

function cal() {
	declare -a tab
	tab=($@)
	suma_1=0 | bc -l
	
	for ((i=1;i<=$#-1; i++));do
		a=${tab[i-1]}
		b=${tab[i]}
		let s=$a+$b
		echo "s = $s"
		
		h=$(echo "($b-$a)/$#" | bc -l) 
		echo "h = $h" 
		
		p=$(echo "$s/2"*$h | bc -l)
		echo "p = $p"
		
		suma_1=$(echo "$suma_1+$p" | bc -l)
		#((suma=$suma+$p))
		echo "suma = $suma_1"
	done		
	
	echo "$suma" | bc -l
}

cal $@


