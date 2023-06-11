#!/bin/bash

#Z1
function f1() {
	# $1 - plik wejsciowy
	# $2 - pierwszy plik docelowy
	# $3 - drugi plik docelowy

	if [[ -r $1 ]];then
		echo "Masz uprawnienia do odczytu pliku zrodlowego"
	else
		echo "Blad, nie masz uprawnien do odczyty pliku zrodlowego" >&2
		exit -1;	
	fi
	
	#czy pliki docelowa istnija
	if [[ -f $2 && -f $3 ]];then
		echo "Pliki docelowe istnieja"
                
		#wyczyszczenie zawartosci plikow docelowych
                > $2
                > $3

		#czy mam uprawnienia do zapisu
		if [[ -w $2 && -w $3 ]];then
			echo "Masz uprawnienia do zapisu do plikow docelowych"
		fi

	else
		echo "Nie ma plikow doecelowych" >&2
		touch ./$2 ./$3		
		echo "Stworzylem pliki docelowe"
	fi	

	ran=0
	while read line;do
		((ran=$RANDOM%2))
		((ran=$ran + 2))
		if [[ $ran == 2 ]];then
			echo "$line" >> $2
		else
			echo "$line" >> $3
		fi
	done < $1
}

#f1 $1 $2 $3

function f2() {
	if [[ -e $1 && -d $1 ]];then
		echo "Sciezka istnieje i wskazuje na katalog"
	else
		echo "Sciezka nie istnieje lub nie wskazuje katalogu" >&2
		exit -1;
	fi

	if [[ -w $1 ]];then
		echo "Masz prawo do zapisywania"
	else
		echo "Nie masz uprawnien do zapisu" >&2
		exit -1;
	fi

	if [[ -r $2 ]];then
		echo "Masz uprawnienia do odczuty pliku"
	else
		echo "Nie masz uprawnien do odczytu pliku"
		exit -1;
	fi

	
	while read line;do
		mkdir $1/$line
		for i in {0..9};do
			touch "$1/$line/F$i"
		done	
	done < $2

	echo "======================="
	tree ./
}

f2 $1 $2


