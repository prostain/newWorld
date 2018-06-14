#ifndef PASSERELLE_H
#define PASSERELLE_H
#include <iostream>
#include "collectionvariete.h"
#include "collectionrayon.h"
#include "collectionproduit.h"
#include "jeuenregistrement.h"
using namespace std;

class Passerelle
{
public:
    Passerelle();
    static CollectionVariete chargerLesVarietes(int);
    static CollectionRayon chargerLesRayons();
    static CollectionProduit chargerLesProduits(int);
};

#endif // PASSERELLE_H
