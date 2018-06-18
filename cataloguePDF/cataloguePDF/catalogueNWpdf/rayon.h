#ifndef RAYON_H
#define RAYON_H
#include <iostream>
#include <QVariant>
using namespace std;

class Rayon
{
    private:
        int rayonId;
        QString rayonLibelle;
    public:
        Rayon();
        Rayon(int idRayon, QString libelleRayon);
        QString versChaine();
        int getId();
};

#endif // RAYON_H
