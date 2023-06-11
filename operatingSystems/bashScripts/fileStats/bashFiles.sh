#!/bin/bash

#Sprawdzenie plików/katalogów
#Przyjmijmy, że pierwszy argument przechowuje ścieżkę do pliku, katalogu bądź urządzenia

if [[ -e $1 ]];then
    echo "Ścieżka istnieje/ Obiekt istnieje" #W tej chwili nie wiemy, czy jest to plik, folder czy urządzenie
    
fi

if [[ -f $1 ]];then
    echo "Zwyczajny plik istnieje"
fi

if [[ -d $1 ]];then
    echo "Folder istnieje"
fi

if [[ -b $1 ]];then
    echo "Urządzenie blokowe istnieje istnieje"
fi

if [[ -r $1 ]];then
    echo "Mamy prawo do odczytu"
fi

if [[ -w $1 ]];then
    echo "Mamy prawo do zapisu"
fi




#Czytanie zawartości pliku
cnt=1
wcnt=1
gcnt=1
while read line;do #Wczytywanie pliku linijka po linijce
    echo "Line[$cnt]: "$line #Wyświetlenie linii wraz z ich numerami
    wcnt=1
    for word in $line;do #iterujemy po słowac znajdujących się w linii (przy założeniu, że słowa rozdzielone są białymi znakami)
        echo "Word[$wcnt]: $word" 
        ((wcnt++)) #Iteracja licznika słów
        ((gcnt++))
    done
    ((cnt++))
done  <<EOF #Tutaj zastosowano mechanizm 'here document'. Umożliwia on zadeklarowanie treści pliku wewnątrz skryptu, co jest wygodne w tym przykładzie. Zamiast tego linia mogłaby wyglądać 'done <$1', gdzie $1 jest ścieżką do zewnętrznego pliku 
linia pierwsza
druga linia
345 ddd 
;'789  99 99 ;; ;; 
Tab tt
EOF

#Teraz zastosujemy alternatywny sposób przetwarzania pliku
tmpFile=$(mktemp) #Tworzymy plik tymczasowy w katalogu /tmp. Zmienna tmpFile przechowuje ścieżkę dostępu do pliku

cat << EOF > $tmpFile #wypełniamy plik treścią za pomocą techniki 'here document'
linia pierwsza
druga linia
345 ddd 
;'789  99 99 ;; ;; 
Tab tt
EOF

gcnt=1
cat $tmpFile|tr [a-z] [A-Z]|while read line;do # w ten sposób możemy przetwarzać plik potokowo przed wczytaniem jego linii w skrypcie
    echo $line
    ((gcnt++))
done

echo "Globalny licznik: $gcnt" 
# To nie błąd licznik będzie miał wartość 1. Dzieje się tak dlatego, że ten sposób przetwarzania otwiera nowy proces, w którym linie są wczytywane.


