#ifndef JEUENREGISTREMENT_H
#define JEUENREGISTREMENT_H

#include <iostream>
#include <QSqlQuery>
#include <QVariant>
using namespace std;

class JeuEnregistrement
{
private:
    QSqlQuery maRequete;
public:
    JeuEnregistrement(QString txtRequete);
    bool suivant();
    bool fin();
    QVariant getValeur(QString momChamp);
    void fermer();
};

#endif // JEUENREGISTREMENT_H
