#ifndef COLLECTIONVARIETE_H
#define COLLECTIONVARIETE_H

#include <iostream>
#include <vector>
#include "variete.h"

using namespace std;

class CollectionVariete
{
public:
    vector <Variete> vectMesVarietes;
public:
    CollectionVariete();
    int cardinal();
    Variete ObtenirVariete(int index);
    void ajouter(Variete laVariete);
};

#endif // COLLECTIONVARIETE_H
