#!/bin/bash
#Zad_1
echo -ne "Zad_1\n"
awk -F "," '{if (NF != 10) print}' cities.csv
#Zad_2
#echo -ne "\nZad_2\n"
#for((i=1;i<=12;++i)){
#    tab[$i]=0
#}
#awk -F ";" '{zuzycie=$3}
#        {z=zuzycie+0.0}
#        {miesiac=(substr($1,6,2))}
#        {miech=miesiac+0}
#        {tab[miech] += z}
#        
#        END {for (i in tab)
#        print("i=" i "\t" tab[i])        
#} ' elicznik.csv 
#Zad_2
echo -ne "\nZad_2\n"
awk -F ";" '{n=split($1, tab, /-/ )  
        kwh[ tab[2] ] += $3}    
    END {for(i in kwh) {
            printf("%s\t%.4f\n", i, kwh[i])    
        }
} ' elicznik.csv | sort -k 1n
#Zad_3
echo -ne "\nZad_3\n"
awk -F ";" '{m=split($2, tab, /:/ )  
        godz[ tab[1] ] += $3}    
    END {for(i in godz) {
            printf("%s\t%.4f\n", i, godz[i])    
        }
} ' elicznik.csv | sort -k 1n
        
#Zad_4
echo -ne "\nZad_4\nDane dla pliku tutor.txt\n"
awk '{z1 += length; s1 += NF; l1++} 
    END {print("Liczba znakow : "z1 "\nLiczba slow : "s1 "\nLiczba linii : " l1)}
' tutor.txt
echo "-------------------------------"
echo "Dane dla pliku loremipsum.txt"
awk '{z2 += length; s2 += NF; l2++} 
    END {print("Liczba znakow : "z2 "\nLiczba slow : " s2 "\nLiczba linii : " l2 )}
' loremipsum.txt
#Zad_5
echo -ne "\nW zadaniu 5 przekierowalem wyniki do plikow"
awk '{for(i=1;i<=NF;i++) 
        s1[$i]++} 
    END {for(i in s1) 
        print i "\t" s1[i]}
' tutor.txt > l_w_s_t.txt
awk '{for(i=1;i<=NF;i++) 
        s2[$i]++} 
    END {for(i in s2) 
        print i "\t" s2[i]}
' loremipsum.txt > l_w_s_l.txt
#Zad_6
echo -ne "\nW zadaniu 6 zrobilem tak samo jak w 5 (wyniki w plikach)\n"
#wyrazenie "if ($i !~ /[^a-zA-Z0-9]/)" sprawdza czy dane slowo ma w sobie jakies inne znaki niz te wymienione w [], jezeli nie ma to zaliczamy jako "zwezone" slowo
awk '{for(i=1;i<=NF;i++) 
    if ($i !~ /[^a-zA-Z0-9]/)    
        s3[$i]++} 
    END {for(i in s3) 
        print i "\t" s3[i]}
' loremipsum.txt > z_l_w_s_l.txt
awk '{for(i=1;i<=NF;i++) 
    if ($i !~ /[^a-zA-Z0-9]/)    
        s4[$i]++} 
    END {for(i in s4) 
        print i "\t" s4[i]}
' tutor.txt > z_l_w_s_t.txt
 
