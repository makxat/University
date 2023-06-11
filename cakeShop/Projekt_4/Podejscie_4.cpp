#include <iostream>
#include <fstream>
#include <iomanip>
#include "Naglowki.hpp"

using namespace std;

dane nowe_dane[200];
dane temp[10];
int licznik_produktow = ile_wierszy();
int licznik_nowych_p = 0;

int main() {
    int zadanie = 0;
    do {
        system("cls");
        zadanie = menu();
        switch(zadanie) {
            case 0:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nKonczymy, milego dnia!";
                break;
            case 1:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja dodawania produktu\n";
                dodawanie_produktu();
                zapis_do_pliku_nowych_p();
                powrot_do_menu();
                break;
            case 2:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja usuwania produktu\n\n";
                wcztanie_bazy_danych(nowe_dane);
                odczyt_z_pliku();
                usuwanie_produktu(nowe_dane);
                powrot_do_menu();
                break;
            case 3:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja zamiany danych\n\n";
                wcztanie_bazy_danych(nowe_dane);

                cout << "\n";
                zmiana_danych_produktu(nowe_dane);
                powrot_do_menu();
                break;
            case 4:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja dodania/zamiany daty dostawy produktu\n";

                powrot_do_menu();
                break;
            case 5:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja wyszukiwania po nazwie/kategorii produktu\n";

                powrot_do_menu();
                break;
            case 6:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja zapisu bazy danych do pliku\n";

                zapis_danych(nowe_dane);
                powrot_do_menu();
                break;
            case 7:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nFunkcja wczytania bazy danych z pliku\n\n";
                wcztanie_bazy_danych(nowe_dane);
                powrot_do_menu();
                break;
            case 8:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nWypis bazy danych na ekran\n\n";
                odczyt_z_pliku();
                powrot_do_menu();
                break;
            default:
                system("cls");
                cout << "CUKIERNIO-CIASTKARNIA\n\nPodano bledna wartosc !\n";
        }
    }while(zadanie != 0);

    return 0;
}

int menu() {
    int z = 0;
    cout << "CUKIERNIO-CIASTKARNIA\n\nDostepne czynnosci:\n"
        << "1 - dodanie produktu\n"
        << "2 - usuniecie produktu\n"
        << "3 - zmiana danych produktu\n"
        << "4 - dodanie/zmiana daty dostawy\n"
        << "5 - wyszukiwanie po nazwie/kategorii produktu\n"
        << "6 - zapis do pliku\n"
        << "7 - wczytanie zapisanej bazy danych z pliku\n"
        << "8 - wypisanie bazy danych na ekran\n"
        << "0 - konczymy\n\n";
    cout << "Podaj ktora czynnosc chcesz wykonac: ";
    cin >> z;
    cin.ignore();

    return z;
}

void powrot_do_menu() {
    char litera = '0';
    while(litera != 'p') {
            cout << "\nPowrot do menu (kliknij p): ";
            cin >> litera;
    }
}

void dodawanie_produktu() {
    string nazwa_1 = "0";
    cout << "NAZWA: ";
    getline(cin, nazwa_1);
    nowe_dane[licznik_nowych_p].nazwa = nazwa_1;

    string kat_1 = "0";
    do{
        system("cls");
        cout << "CUKIERNIO-CIASTKARNIA\n\nDostepne kategorie\n"
             << "Ciasto\n"
             << "Bulka\n"
             << "Chleb\n"
             << "CiastoDrozdzowe\n"
             << "Ciastko\n"
             << "Lody\n"
             << "\nKATEGORIA: ";
        getline(cin, kat_1);
        nowe_dane[licznik_nowych_p].kategoria = kat_1;
    }while(czy_nalezy_do_kat(nowe_dane[licznik_nowych_p].kategoria));

    ///LICZBA SZTUK
    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nLICZBA SZTUK: ";
    cin >> nowe_dane[licznik_nowych_p].liczba_sztuk;

    ///CENA J
    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nCENA JEDNOSTKOWA: ";
    cin >> nowe_dane[licznik_nowych_p].cen_jedn;

    ///ILOSC
    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nILOSC: ";
    cin >> nowe_dane[licznik_nowych_p].ilosc;

    ///CENA ZA KG
    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nCENA ZA KG: ";
    cin >> nowe_dane[licznik_nowych_p].c_z_kg;

    ///DATA
    do{
        system("cls");
        cout << "CUKIERNIO-CIASTKARNIA\n\nDATA DOSTAWY (format DD MM RRRR: ";
        cin >> nowe_dane[licznik_nowych_p].dzien >> nowe_dane[licznik_nowych_p].miesiac >> nowe_dane[licznik_nowych_p].rok;
    }while(!warunek_daty(nowe_dane[licznik_nowych_p].dzien, nowe_dane[licznik_nowych_p].miesiac, nowe_dane[licznik_nowych_p].rok));
    cin.ignore();

    ///DODATKI
    string dodatek_1 = "0";
    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nDostepne dodatki\n"
         << "PolewaCzekoladowa\n"
         << "PolewaTruskawkowa\n"
         << "PolewaKarmelowa\n"
         << "PosypkaKolorowa\n"
         << "PosypkaCzekoladowa\n"
         << "PosypkaWaflowa\n"
         << "Kruszonka\n"
         << "BitaSmietana\n"
         << "Brak\n"
         << "\nDODATKI (wymianiac po przecinku i piasac bez spacji): ";
    getline(cin, dodatek_1);
    nowe_dane[licznik_nowych_p].dodatki = dodatek_1;
    licznik_produktow++;
    licznik_nowych_p++;
}

bool czy_nalezy_do_kat(string s) {
    string* kat = new string[7];
    *(kat+0) = "Ciasto";
    *(kat+1) = "Bulka";
    *(kat+2) = "Chleb";
    *(kat+3) = "CiastoDrozdzowe";
    *(kat+4) = "Ciastko";
    *(kat+5) = "Lody";
    *(kat+6) = "Brak";
    if((s != kat[0]) && (s != kat[1]) && (s != kat[2]) && (s != kat[3]) && (s != kat[4]) && (s != kat[5]) && (s != kat[6])) {
        delete [] kat;
        return true;
    }
    delete [] kat;
    return false;
}

bool warunek_daty(int dzien, int miesiac, int rok) {
    bool rok_b;
    bool miesiac_b;
    bool dzien_b;

    if(rok == 2023 || rok == 2022) {
        if(miesiac >= 1 && miesiac <= 12) {
            switch(miesiac) {
                case 1: ///styczen
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 2: ///luty
                    if(dzien >= 1 && dzien <= 28) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 3: ///marzec
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 4: ///kwiecieñ
                    if(dzien >= 1 && dzien <= 30) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 5: ///maj
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 6: ///czerwiec
                    if(dzien >= 1 && dzien <= 30) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 7: ///lipiec
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 8: ///sierpieñ
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 9: ///wrzesieñ
                    if(dzien >= 1 && dzien <= 30) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 10: ///pa¿dziernik
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 11: ///listopad
                    if(dzien >= 1 && dzien <= 30) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
                case 12: ///grudzieñ
                    if(dzien >= 1 && dzien <= 31) {
                        rok_b = true;
                        miesiac_b = true;
                        dzien_b = true;
                    }
            }
        }
    }else
        cout << "\nNie robimy dostaw dalej niz za rok!\n";

    if(rok_b && miesiac_b && dzien_b)
        return true;
    return false;
}

void usuwanie_produktu(dane (&x)[200]) {
    int wiersz = 0;
    cout << "\nKtory wiersz chcesz usunac: ";
    cin >> wiersz;
    for(int i = wiersz; i < licznik_produktow; i++) {
        nowe_dane[i-1].nazwa = nowe_dane[i].nazwa;
        nowe_dane[i-1].kategoria = nowe_dane[i].kategoria;
        nowe_dane[i-1].liczba_sztuk = nowe_dane[i].liczba_sztuk;
        nowe_dane[i-1].cen_jedn = nowe_dane[i].cen_jedn;
        nowe_dane[i-1].ilosc = nowe_dane[i].ilosc;
        nowe_dane[i-1].c_z_kg = nowe_dane[i].c_z_kg;
        nowe_dane[i-1].dzien = nowe_dane[i].dzien;
        nowe_dane[i-1].miesiac = nowe_dane[i].miesiac;
        nowe_dane[i-1].rok = nowe_dane[i].rok;
        nowe_dane[i-1].dodatki = nowe_dane[i].dodatki;
    }
    licznik_produktow--;
    cout << "\n\nPo usunieciu: \n";
    for(int i = 0; i < licznik_produktow; i++) {
        cout << nowe_dane[i].nazwa << "\t"
             << nowe_dane[i].kategoria << "\t"
             << nowe_dane[i].liczba_sztuk << "\t"
             << nowe_dane[i].cen_jedn<< "\t"
             << nowe_dane[i].ilosc<< "\t"
             << nowe_dane[i].c_z_kg<< "\t"
             << nowe_dane[i].dzien<< "\t"
             << nowe_dane[i].miesiac << "\t"
             << nowe_dane[i].rok << "\t"
             << nowe_dane[i].dodatki << "\n";
    }
}

void zmiana_danych_produktu(dane (&x)[200]) {
    int wiersz = 0;
    cout << "Ktory wiersz chcesz zmienic: ";
    cin >> wiersz;

    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nSTARA NAZWA: " << nowe_dane[wiersz-1].nazwa << "\nNOWA NAZWA: ";
    cin >> nowe_dane[wiersz].nazwa;

    do{
        system("cls");
        cout << "CUKIERNIO-CIASTKARNIA\n\nDostepne kategorie\n"
             << "Ciasto\n"
             << "Bulka\n"
             << "Chleb\n"
             << "CiastoDrozdzowe\n"
             << "Ciastko\n"
             << "Lody\n"
             << "\nNOWA KATEGORIA: ";
        cin >> nowe_dane[wiersz].kategoria;
    }while(czy_nalezy_do_kat(nowe_dane[wiersz].kategoria));

    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nNOWA LICZBA SZTUK: ";
    cin >> nowe_dane[wiersz].liczba_sztuk;

    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nNOWA CENA JEDNOSTKOWA: ";
    cin >> nowe_dane[wiersz].cen_jedn;

    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nNOWA ILOSC: ";
    cin >> nowe_dane[wiersz].ilosc;

    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nNOWA CENA ZA KG: ";
    cin >> nowe_dane[wiersz].c_z_kg;

    do{
        system("cls");
        cout << "CUKIERNIO-CIASTKARNIA\n\nNOWA DATA DOSTAWY (format DD MM RRRR: ";
        cin >> nowe_dane[wiersz].dzien >> nowe_dane[wiersz].miesiac >> nowe_dane[wiersz].rok;
    }while(!warunek_daty(nowe_dane[wiersz].dzien, nowe_dane[wiersz].miesiac, nowe_dane[wiersz].rok));
    cin.ignore();

    ///DODATKI
    system("cls");
    cout << "CUKIERNIO-CIASTKARNIA\n\nDostepne dodatki\n"
         << "PolewaCzekoladowa\n"
         << "PolewaTruskawkowa\n"
         << "PolewaKarmelowa\n"
         << "PosypkaKolorowa\n"
         << "PosypkaCzekoladowa\n"
         << "PosypkaWaflowa\n"
         << "Kruszonka\n"
         << "BitaSmietana\n"
         << "\nNOWE DODATKI (wymianiac po przecinku i piasac bez spacji):: ";
    cin >> nowe_dane[wiersz].dodatki;

    //zapis_do_pliku();
}

void zapis_do_pliku_nowych_p() {
    fstream plik;
    plik.open("dane.txt", std::ios::app);
    for(int i = 0; i < licznik_nowych_p; i++) {
        plik << nowe_dane[i].nazwa << "\t"
             << nowe_dane[i].kategoria << "\t"
             << nowe_dane[i].liczba_sztuk << "\t"
             << nowe_dane[i].cen_jedn << "\t"
             << nowe_dane[i].ilosc << "\t"
             << nowe_dane[i].c_z_kg << "\t"
             << nowe_dane[i].dzien << "\t"
             << nowe_dane[i].miesiac << "\t"
             << nowe_dane[i].rok << "\t"
             << nowe_dane[i].dodatki << "\n";
    }
    plik.close();
}

void zapis_danych(dane (&x)[200]) {
    fstream plik;
    plik.open("dane.txt");
    cout << "\n\nLICZNIK PRODUKTOW:" << licznik_produktow << "\n\n";;
    plik << "NAZWA	KATEGORIA	LICZBA_SZTUK	CENA_JEDNOSTKOWA	ILOSC	CENA_ZA_KG	DZIEN	MIESIAC	ROK	DODATKI\n";
    for(int i = 0; i < licznik_produktow; i++) {
        plik << nowe_dane[i].nazwa << "\t"
             << nowe_dane[i].kategoria << "\t"
             << nowe_dane[i].liczba_sztuk << "\t"
             << nowe_dane[i].cen_jedn << "\t"
             << nowe_dane[i].ilosc << "\t"
             << nowe_dane[i].c_z_kg << "\t"
             << nowe_dane[i].dzien << "\t"
             << nowe_dane[i].miesiac << "\t"
             << nowe_dane[i].rok << "\t"
             << nowe_dane[i].dodatki << "\n";
        cout << nowe_dane[i].nazwa << "\t"
             << nowe_dane[i].kategoria << "\t"
             << nowe_dane[i].liczba_sztuk << "\t"
             << nowe_dane[i].cen_jedn << "\t"
             << nowe_dane[i].ilosc << "\t"
             << nowe_dane[i].c_z_kg << "\t"
             << nowe_dane[i].dzien << "\t"
             << nowe_dane[i].miesiac << "\t"
             << nowe_dane[i].rok << "\t"
             << nowe_dane[i].dodatki << "\n";
    }
    plik.close();
}

void odczyt_z_pliku() {
    fstream plik;
    plik.open("dane.txt");
    if(plik) {
        string linia;
        while(getline(plik, linia)) {
            cout << linia << "\n";
        }
    }else
        cout <<  "BLAD! Nie mozna otworzyc pliku\n";
    plik.close();
}

int ile_wierszy() {
    int licznik = 0;
    fstream plik;
    string linia;
    plik.open("dane.txt");
    if(plik) {
        while(getline(plik, linia))
            licznik++;
    }else
        cout <<  "BLAD! Nie mozna otworzyc pliku\n";
    plik.close();
    return licznik-1;
}

void wcztanie_bazy_danych(dane (&x)[200]) {
    fstream plik;
    plik.open("dane.txt");
    //cout << "\n\n" << "Ile_wierszy : " <<ile_wierszy() << "\n\n";
    string temp;
    cout << "\n\nWCZYTANIE_Z_PLIKU\n";
    for(int i = 0; i < 10; i++) {
        plik >> temp;
        cout << temp << "\t";
    }
    for(int i = 0; i < ile_wierszy(); i++) {
        plik >> nowe_dane[i].nazwa;
        plik >> nowe_dane[i].kategoria;
        plik >> nowe_dane[i].liczba_sztuk;
        plik >> nowe_dane[i].cen_jedn;
        plik >> nowe_dane[i].ilosc;
        plik >> nowe_dane[i].c_z_kg;
        plik >> nowe_dane[i].dzien;
        plik >> nowe_dane[i].miesiac;
        plik >> nowe_dane[i].rok;
        plik >> nowe_dane[i].dodatki;


        cout << nowe_dane[i].nazwa << "\t"
             << nowe_dane[i].kategoria << "\t"
             << nowe_dane[i].liczba_sztuk << "\t"
             << nowe_dane[i].cen_jedn << "\t"
             << nowe_dane[i].ilosc << "\t"
             << nowe_dane[i].c_z_kg << "\t"
             << nowe_dane[i].dzien << "\t"
             << nowe_dane[i].miesiac << "\t"
             << nowe_dane[i].rok << "\t"
             << nowe_dane[i].dodatki << "\n";

    }
    cout << "\n\n";
    plik.close();

}

