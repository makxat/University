#!/usr/bin/python3
import sys
import random
import math

print("Zad_1\n")
#Ustawienie biezacy czas systemowy jako punkt odniesieniea dla lsowanych liczb 
random.seed()
print('Witaj w interaktywnej grze\n')
liczba = input("Podaj prosze liczbe : ")
#print("Twoja liczba to : {liczba}".format(liczba=liczba))
los = random.randint(1, 20)
#print("Komputer wylosowal licze : " + str(los))
while(True):
    if(int(liczba) == int(los)):
        print("Trafiles/as\nKoniec Programu")
        #Przerwanie programu gdy trafilismy
        sys.exit(0)
    else:
        if(int(liczba) > int(los)):
            print("Podales/as za duza liczbe!")
        else:
            print("Podales/as za mala liczbe")
    print("-------------------------------")
    liczba = input("Podaj prosze liczbe : ")

#W tym zadaniu nie uwzglednilem co gdyby uzytkownik podal liczby ujemne jako bok
def czy_mozna_zbudowac_t(x, y, z):
    if ((x + y > z) and (x + z > y) and (z + y > x)):
        return True
    return False    
def p_t_1(a, h):
    pole = (1/2)*a*h
    return pole
def p_t_2(a, b, y):
    pole = (1/2)*a*b*math.sin(y)
    return pole
def p_t_3(a, b, c):
    p = (a+b+c)/2
    pole = math.sqrt(p*(p-a)*(p-b)*(p-c))
    return pole
def p_t_4(a, b, c, R):
    return (a*b*c)/(4*R)
def p_t_5(R, alfa, beta, gama):
    return 2*R^2*math.sin(alfa)*math.sin(beta)*math.sin(gama)
def p_t_6(a, b, c, R):
    return r*((a+b+c)/2)
def p_p(a ,b):
    return a*b
figura = input("Pole jakiej figury chcialbys policzyc (trojkat - t/trojkat, prostokat - p/prostokat : ")
if(figura == "t" or figura == "trojkat"):
    print("Wzor 1 (1) : P = 1/2*a*h")
    print("Wzor 2 (2) : P = 1/2*a*b*sin(y)")
    print("Wzor 3 (3) : P = sqrt(p(p-a)*(p-b)*(p-c))")
    print("Wzor 4 (4) : P = (a*b*c)/(4*R)")
    print("Wzor 5 (5) : P = R^2*sin(x)*sin(y)*sin(z)")
    print("Wzor 6 (6) : P = r*(a+b+c)/2")
    wzor = int(input("Z ktorego wzoru chcesz skorzystac: "))
    match wzor:
        case 1:
            a = float(input("a = "))
            h = float(input("h = "))
            print("Pole trojkata : " + str(p_t_1(a, h)))
        case 2:
            a = float(input("a = "))
            b = float(input("b = "))
            y = float(input("y (kat miedzy a i b) = "))
            print("Pole trojkata : " + str(p_t_2(a, b, y)))
        case 3:
            a = float(input("a = "))
            b = float(input("b = "))
            c = float(input("c = "))
            if(czy_mozna_zbudowac_t(a, b, c)):
                print("Pole trojkata : " + str(p_t_3(a, b ,c)))
            else:
                print("Uzywajac tych dlugosci bokow, nie da sie zbudowac trojkata :(")
        case 4:
            a = float(input("a = "))
            b = float(input("b = "))
            c = float(input("c = "))
            R = float(input("R = "))
            if(czy_mozna_zbudowac_t(a, b, c)):
                print("Pole trojkata : " + str(p_t_4(a, b ,c, R)))
            else:
                print("Uzywajac tych dlugosci bokow, nie da sie zbudowac trojkata :(")    
        case 5:
            a = float(input("alfa = "))
            b = float(input("beta = "))
            c = float(input("gama = "))
            R = float(input("R = "))
            print("Pole trojkata : " + str(p_t_5(a, b, c, R)))
        case 6:
            a = float(input("a = "))
            b = float(input("b = "))
            c = float(input("c = "))
            r = float(input("r = "))
            if(czy_mozna_zbudowac_t(a, b, c)):
                print("Pole trojkata : " + str(p_t_6(a, b ,c, r)))
            else:
                print("Uzywajac tych dlugosci bokow, nie da sie zbudowac trojkata :(")
        case _:
            print("Podales/as zla liczbe")
            
if(figura == "p" or figura == "prosotka"):
    a = float(input("a = "))
    b = float(input("b = "))
    print("Pole prostokata : " + str(p_p(a, b)))


liczba = int(input("Podaj liczbe z przedzialu (1,100): "))
while(True):
    if((int(liczba) <= 100) and (int(liczba) >= 1)):
        break;
    if(int(liczba) < 1):
        print("Podales/as zla liczbe")
        liczba = input("Podaj liczbe z przedzialu (1,100): ")
    else:
        if(int(liczba) > 100):
            print("Podales/as zla liczbe")
            liczba = input("Podaj liczbe z przedzialu (1,100): ")
print("Oto dzieliniki liczby : " + str(liczba))
for i in range(int(liczba)+1, 0, -1):
    if liczba % i == 0:
        print(i)
