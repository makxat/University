#!/usr/bin/python3
import csv
import sys
#otwieranie pliku i czytanie zawartosci tego pliku ("r" -> read, odczyt)
print("Zad_1a")
with open("grades.csv", "r") as plik:
    czytanie_pliku = csv.reader(plik)
    #Nie potrzebujemy czytac nazw kolumn, wiec je pomijamy
    next(czytanie_pliku, None)
    licz=1
    for wiersz in czytanie_pliku:
        licznik = 0
        srednia = 0
        #konwertoewanie "string'ow" od kolumny 4 (wlacznie) na float (wartosc liczbowa)
        wiersz[3:8] = map(float, wiersz[3:8])
        for i in range(3, 8):
            if(wiersz[i] == -1):
                wiersz[i] = 0
            licznik += wiersz[i]
            #print(licznik)
        srednia = licznik / 5                
        print('Student ' + str(licz) + '\tsr: ' + str(srednia))
        licz = licz + 1
print('\nZad_1b')
#tworzenie list pomocniczych
oceny = [0.0,0.0,0.0,0.0,0.0]
licznik_ocen = [0,0,0,0,0]
with open("grades.csv", "r") as plik:
    czytanie_pliku = csv.reader(plik)
    next(czytanie_pliku, None)
    for wiersz in czytanie_pliku:
        wiersz[3:8] = map(float, wiersz[3:8])
        for i in range(3, 8):
            if(wiersz[i] == -1):
                wiersz[i] = 0
                licznik_ocen[i-3] -= 1
            oceny[i-3] += wiersz[i]
            licznik_ocen[i-3] += 1
    for i in range(len(oceny)):
        print(oceny[i] / licznik_ocen[i])
    
print('\nZad_2')        
kody_pocztowe = {}
with open("m-246101-BielskoBiala.adr", "r") as plik:    
    czytanie_pliku = csv.reader(plik)
    #Pomijanie pierwszych 6 wierszy, ktore sa jakims nieznaczacym w tym zadaniu tekstem
    for i in range(6):
        next(czytanie_pliku, None)
    for wiersz in czytanie_pliku:
        #sprawdzenie czy dany "klucz" jest juz w slowniku, jezeli nie ma go to go dodajemy
        if(wiersz[7] not in kody_pocztowe):
            kody_pocztowe[wiersz[7]] = 0
        kody_pocztowe[str(wiersz[7])] += 1
    
    #wypisanie klucza (kodu pocztowego) wraz z iloscia jego wysatpien
    #dict.items() -> sluzy do zwracania klucz-wartosc
    for key, value in kody_pocztowe.items():
        #Jezeli zakomentuje nastepna linie to wyswitla sie wszystkie kody pocztowe ze swoimy liczbami wystapien
        if(kody_pocztowe[key] < 10):
            print(key, value)
    
    print("=========================") 
    l_wystapien = max(kody_pocztowe.values())
    kod = max(kody_pocztowe, key=kody_pocztowe.get)
    print(str(l_wystapien) + "\t" + str(kod))
    
    
        
    
    
