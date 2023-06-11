#ifndef NAGLOWKI_HPP
#define NAGLOWKI_HPP

struct dane {
    std::string nazwa;
    std::string kategoria;
    unsigned int liczba_sztuk;
    float cen_jedn;
    unsigned int ilosc;
    float c_z_kg;
    struct {
        unsigned int dzien;
        unsigned int miesiac;
        unsigned int rok;
    };
    std::string dodatki;
};

int menu();

void powrot_do_menu();

void dodawanie_produktu();

bool czy_nalezy_do_kat(std::string s);

bool warunek_daty(int dzien, int miesiac, int rok);

void usuwanie_produktu(dane (&)[200]);

void zmiana_danych_produktu(dane (&)[200]);

void zapis_do_pliku_nowych_p();

void zapis_danych(dane (&)[200]);

void odczyt_z_pliku();

int ile_wierszy();

void wcztanie_bazy_danych(dane (&)[200]);

#endif // NAGLOWKI_HPP
