#ifndef COLLECTIONPRODUIT_H
#define COLLECTIONPRODUIT_H

#include <iostream>
#include <vector>
#include "produit.h"

using namespace std;


class CollectionProduit
{
private:
    vector <Produit> vectMesProduit;
public:
    CollectionProduit();
    int cardinal();
    Produit ObtenirProduit(int index);
    void ajouter(Produit leProduit);
};

#endif // COLLECTIONPRODUIT_H
