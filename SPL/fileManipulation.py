#!/usr/bin/python3
 
import sys
import string
plik = open('tekst.txt', 'r').read()
linia = plik.split('\n')
#sprawdzamy jakie argumenty podal uzytkowyk
for opcja in sys.argv[1:]:
    if opcja == '-r':
        for l in linia:
            #str[start:stop:step] -> wypisujemy wszysko po 1 literce ale od konca
            print(l[::-1])
    if opcja == '-w':
        for l in linia:        
            print(' '.join(l.split()[::-1]))
        
    if opcja == '-R':
        for l in linia:
            for a in l.split():
                z = (a[::-1])
                print(z)
            
    if opcja == '-U':
        for l in linia:
            print(l.title())
    if opcja == '-u':
        for l in linia:
            print(l.upper())
    '''
    if opcja == '-H':
        for l in linia:
            slowa = l.split()
            print(slowa)
            for i in slowa:
                dlugosc_slowa = len(slowa)
                if (dlugosc_slowa % 2 == 0):
                    upp = int(len(slowa) / 2)
                    low = int(len(slowa) / 2)
                else:
                    upp = int(((len(slowa) / 2) + 1))
                    low = int(len(slowa) / 2)
                #str[start:stop:step]
                print(l[0:upp:].upper() + l[low::].lower())
    '''
    if opcja == '-l':
        for l in linia:
            print(l.lower())
    if opcja == '-a':
        for l in linia:
            alf = l.split()
            alf.sort()
            text = ' '.join(alf)
            print(text)
            
    #if opcja == '-d':
        #for i in opcja:
            
    
    if opcja == '-c':
        for l in linia:
            slowa = l.split()
            print(str(len(slowa)) + "w, " + str(len(l)) + "c: " + "\t" + l)
    
#opcja -H nie dzial, -d 
