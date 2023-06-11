#!/bin/bash
#Zad_1a
#w sumie mozna to zrobic w petli, a nie tak rozpisywac -_-
echo -ne "Zad_1a\n"
awk -F "," '{if(NR != 1) {
        $4=$4+0.0
        $5=$5+0.0
        $6=$6+0.0
        $7=$7+0.0
        $8=$8+0.0
                
        if( $4 == -1)  {
            $4=0
        }
        if( $5 == -1)  {
            $5=0
        }
        if( $6 == -1)  {
            $6=0
        }    
        if( $7 == "-1")  {
            $7=0
        }
        if( $8 == -1)  {
            $8=0
        }
        licznik = $4 + $5 + $6 + $7 + $8 
        srednia = licznik / 5
        printf("%.2f\n", srednia)    
        }
}' grades.csv
#Zad_1b
#NF - liczba pol w bierzacym wierszu
echo -ne "\nZad_1b\n"
awk -F "," 'BEGIN{
        for( i=4; i<=8; ++i ) {
            tab[i]=0
            licznik[i]=0
        }    
        }
        {if(NR != 1) {
            $4=$4+0.0
        $5=$5+0.0
        $6=$6+0.0
        $7=$7+0.0
        $8=$8+0.0
        if( $4 == -1)  {
            $4=0
            licznik[4] -= 1
        }
        if( $5 == -1)  {
            $5=0
            licznik[5] -= 1
        }
        if( $6 == -1)  {
            $6=0
            licznik[6] -= 1
        }    
        if( $7 == -1)  {
            $7=0
            licznik[7] -= 1
        }
        if( $8 == -1)  {
            $8=0
            licznik[8] -= 1
        }
        
        
        for(i=4; i<=8; ++i){
            tab[i] += $i
            licznik[i]++
        }
        }
        
        
        }END{for(i in tab){
                printf("%s\t%.4f\n", "Test "i-3, (tab[i]/licznik[i]))    
            }
        }
    
' grades.csv | sort
#Zad_2
#Jezeli w zadaniu 2 pojawia sie 1 (przy wylistowaniu kodow pocztowych i ich ilosci) oznacza to ze na koncu pliku jest nowa linia (enter)
#Zeby ta 1 zniknela z naszej listy, zeby byla ladna nalezy ta nowa linie z konca pliku usunac (to tyczy sie kazdego pliku *.adr w tym zadaniu)
echo -ne "\nZad_2\n"
awk -F "," '{if(NR >= 7) {
        a=$8;
        tab_zad_2[a]++;
        } 
        #ten END (ponizej) wykona sie po na poczatku, potem ten wyzej?
        }END {for(i in tab_zad_2){
                if(tab_zad_2[i] < 10)
                    print(i, tab_zad_2[i]);     
            }
}' m-246101-BielskoBiala.adr | sort -k 2n
echo "-----------------"
awk -F "," '{if(NR >= 7) {
        a=$8;
        tab_zad_3[a]++;
        } 
        }END {
            temp=tab_zad_3[1]
            for(i in tab_zad_3){
            if(tab_zad_3[i] > temp) {
                temp=tab_zad_3[i]
                #print("temp = "temp "\ttab_zad_3[i] = " tab_zad_3[i])
                kod=i
            }
           
       }
       #Jezeli usuniemy ifa z lini 93, zobaczymy ze to jest poprawny wynik
       print("Kod pocztowy:" kod "\tLiczba wystapien: " temp)
}' m-246101-BielskoBiala.adr 
echo "-----------------------------------------------------------"
echo -ne "\nTeraz sprawdze czy dla pliku m-046301-Torun.adr ten skrypt tez dziala\n"
awk -F "," '{if(NR >= 7) {
        a=$8;
        tab_zad_4[a]++;
        } 
        }END {for(i in tab_zad_4){
                if(tab_zad_4[i] < 10)
                    print(i, tab_zad_4[i]);     
            }
}' m-046301-Torun.adr 
echo "-----------------"
awk -F "," '{if(NR >= 7) {
        a=$8;
        tab_zad_5[a]++;
        } 
        }END {
            temp=tab_zad_5[1]
            for(i in tab_zad_5){
            if(tab_zad_5[i] > temp) {
                temp=tab_zad_5[i]
                #print("temp = "temp "\ttab_zad_5[i] = " tab_zad_5[i])
                kod=i
            }
           
       }
       print("Kod pocztowy:" kod "\tLiczba wystapien: " temp)
}' m-046301-Torun.adr
echo "-----------------------------------------------------------"
echo -ne "\nTeraz sprawdze czy dla pliku m-101401-Sieradz.adr ten skrypt tez dziala\n"
awk -F "," '{if(NR >= 7) {
        a=$8;
        tab_zad_6[a]++;
        } 
        }END {for(i in tab_zad_6){
                if(tab_zad_6[i] < 10)
                    print(i, tab_zad_6[i]);     
            }
}' m-101401-Sieradz.adr
echo "-----------------"
awk -F "," '{if(NR >= 7) {
        a=$8;
        tab_zad_7[a]++;
        } 
        }END {
            temp=tab_zad_7[1]
            for(i in tab_zad_7){
            if(tab_zad_7[i] > temp) {
                temp=tab_zad_7[i]
                #print("temp = "temp "\ttab_zad_7[i] = " tab_zad_5[i])
                kod=i
            }
           
       }
       print("Kod pocztowy:" kod "\tLiczba wystapien: " temp)
}' m-101401-Sieradz.adr
