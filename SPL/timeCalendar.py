#!/usr/bin/python3
 
import sys
import string
import datetime
import time
import calendar
import pandas as pd
#print(datetime.date.today())
#print(datetime.datetime.now())
#delta = timedelta()
print("Zad_1")
print("Podaj roznice (d/dzień, h/godzina, m/minuta, s/sekunda) (np. 10d albo 15h 2d 10m) :")
d = int(input("d : "))
h = int(input("h : "))
m = int(input("m : "))
s = int(input("s : "))
print()
#zakladam ze uzytkownik poda porawne dane
print(str(d) + "d " + str(h) + "h " + str(m) + "m " + str(s) + "s")
print()
#print(datetime.timedelta(days = d, hours = h, minutes = m, seconds = s))
roznica = datetime.timedelta(days = d, hours = h, minutes = m, seconds = s)
teraz = datetime.datetime.now()
gtm =  datetime.timedelta(hours=1)
print("teraz : " + "\t" + str(teraz))
print("GTM : " + "\t\t" + str(teraz - gtm))
print("wczesniej : " + "\t" + str(teraz-roznica))
print("pozniej : " + "\t" + str(teraz+roznica))
print("\nZad_2a")
print("Podaj date (format dd.mm.rrrr) : ")
dd = int(input("dd : "))
mm = int(input("mm : "))
rrrr = int(input("rrrr : "))
dzine_tygodnia = calendar.weekday(rrrr, mm, dd)
#print(dzine_tygodnia)
#tablica pomocnicza
dzienTygodnia = ['Poniedzialek', 'Wtorek', 'Sroda', 'Czwartek', 'Piatek', 'Sobota', 'Niedziela']
match dzine_tygodnia:
    case 0:
        print(dzienTygodnia[0])
    case 1:
        print(dzienTygodnia[1])
    case 2:
        print(dzienTygodnia[2])
    case 3:
        print(dzienTygodnia[3])
    case 4:
        print(dzienTygodnia[4])
    case 5:
        print(dzienTygodnia[5])
    case 6:
        print(dzienTygodnia[6])

print("\nZad_2b")
pierwszy_dzien = calendar.monthrange(rrrr, mm)
match pierwszy_dzien[0]:    
    case 0:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[0]))
    case 1:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[1]))
    case 2:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[2]))
    case 3:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[3]))
    case 4:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[4]))
    case 5:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[5]))
    case 6:
        print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) + " : " + str(dzienTygodnia[6]))
#print("Pierwszym dniem miesiaca " + str(mm) + "." + str(rrrr) +" byl : " + str(pierwszy_dzien))

print("\nZad_2c")
kalendarz = calendar.monthcalendar(rrrr, mm)
#print(cal) -> wynik pojawia sie w listach, wiec trzeba je ladnie wyswietlic
#t -> tydzien
#d -> dzien
ktoryMiesiac = ['Styczen', 'Luty', 'Marzec', 'Kwiecien', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpien', 'Wrzesien', 'Pazdziernik', 'Listopad', 'Grudzien']
print("\t    " + str(ktoryMiesiac[mm-1]) + " " + str(rrrr))
#for tydz in kalendarz:
#    print(" ".join(str(dd)    if dd != 0 else "  " for dd in tydz))

print("\t" + "po" + " " + "wt" + " " + "sr" + " " + "cz" + " " + "pi" + " " + "so" + " " + "ni")
#print(kalendarz)
#jakos wypisuje, ale nie tak ladnie 
for tydz in kalendarz:
    #print("t = " + str(t))
    print("      ", end=" ")
    for dzien in tydz:
        #print(dzien)
        if(dzien == 0):
            print(" ", end=" ")
        else:
            #print(dzien, end=" ")
            print("%2d" % dzien, end=" ")
    print()
'''
print("\nZad_3a")
print("Podaj pierwsza date:")
dd_1 = int(input("dd : "))
mm_1 = int(input("mm : "))
rrrr_1 = int(input("rrrr : "))
print("Podaj druga date: ")
dd_2 = int(input("dd : "))
mm_2 = int(input("mm : "))
rrrr_2= int(input("rrrr : "))
data_1 = pd.to_datetime(day=dd_1, month=mm_1, year=rrrr_1)
print(data_1)
'''
 
 
 
 
