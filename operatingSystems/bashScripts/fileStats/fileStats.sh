#!/bin/bash

function f1() {
	# czy istnieje
	if [[ -e "$1" && -f "$1" ]];then
		echo "Plik istnieje"
	else
		echo "Plik nie istnieje"
		exit -1;
	fi

	# czy mam prawo do odczytu
	if [[ -r "$1" ]];then
		echo "Masz prawo do odczytu"
	else
		echo "Nie masz prawa do odczytu"
		exit -1;
	fi

	if [[ -e "$2" && -f "$2" ]];then
		echo "Plik docelowy istnieje"
		if [[ -w "$2" ]];then
			echo "Masz prawo do zapisu do pliku docelowego"
		else
			echo "Nie masz prawa do zapisu do pliku docelowego"
			exit -1;
		fi
	else
		echo "Plik docelowy nie istnieje"
		# czy moge utworzyc plik
		if [[ -w "$(dirname "$2")" ]];then
			echo "Moge utworzyc nowy plik docelowy"
			touch ./$2
			echo "Nowy plik utworzony"
		else
			echo "Nie mozna utworzyc pliku"
			exit -1;
		fi
	fi

	declare -A assoc
	x=0

	for i in {0..9};do
		((assoc["$i"]="$x"))
	done
	while read line;do
		temp=$line
		for ((i=0; i<${#temp}; i++));do
			#ucinanie jednej literkai
			temp_2="${temp:$i:1}"
			if [[ ${assoc[$temp_2]+_} ]];then
				((assoc[$temp_2]++))
			fi
		done
	done <$1
	
	for key in "${!assoc[@]}";do
		echo -e "$key \t ${assoc[$key]}"
	done | sort -rn -k2 > $2

	#sort -rn -> "n"-> po wartosciach liczbowych	"r"-> sort w odwrotnej kolejnosci	"-k2"-> po "drugiej" kolumnie
}

f1 $1 $2 
