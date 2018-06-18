#ifndef PRODUIT_H
#define PRODUIT_H
#include <iostream>
#include <QVariant>
using namespace std;

class Produit
{
private:
    int produitId;
    QString produitLibelle;
public:
    Produit();
    Produit(int idProduit, QString libelleProduit);
    QString versChaine();
    int getId();
};

#endif // PRODUIT_H
