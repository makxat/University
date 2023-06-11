#!/usr/bin/python3
 
import sys
import re
with open('tekst.txt', 'r', encoding='utf-8') as plik:
    tekst = plik.read()
file = open("README.txt", "w")
    
print("Zad_1a")
#\b -> okreslone znaki sa na poczatku lub
aAoO = re.findall(r'[aoAO]\w+', tekst)
print(aAoO)
print("\nZad_1a", file=file)
print(aAoO, file=file)
print("\nZad_1b")
#\w -> a-zA-Z0-9 i _
pol_znak = re.findall(r'\w+[ĄąĆćĘęŁłŃńÓóŚśŹźŻż]\b', tekst)
print(pol_znak)
print("\nZad_1b", file=file)
print(pol_znak, file=file)
print("\nZad_1c")
kropka = re.findall(r'\w+\.', tekst)
print(kropka)
print("\nZad_1c", file=file)
print(kropka, file=file)
print("\nZad_1d")
#spacje = re.findall(r'␣{2,}\w+', tekst) #dlaczego to nie dziala?
spacje = re.findall(r'\s{2,}\w+', tekst) #to dziala dla wszystkich bialych znakow -_-
print(spacje)
print("\nZad_1d", file=file)
print(spacje, file=file)
#to nizej cos nie wyszlo
#print("\nZad_1e")
#samogloski = re.findall(r'\b\w*[aAeEiIoOuUyY]{1}\w+[aAeEiIoOuUyY]{1}\w[aAeEiIoOuUyY]{1}\w*\b', tekst)
#print(samogloski)
#print("\nZad_1e", file=file)
#print(samogloski, file=file)
file.close()
with open('telefony-1.txt', 'r', encoding='utf-8') as p:
    telefon = p.read()

#file = open("README.txt", "w")
#file.close()
 
 
