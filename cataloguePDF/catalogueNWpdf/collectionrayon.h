#ifndef COLLECTIONRAYON_H
#define COLLECTIONRAYON_H

#include <iostream>
#include <vector>
#include "rayon.h"

using namespace std;


class CollectionRayon
{
private:

vector <Rayon> vectMesRayons;

public:
    CollectionRayon();
    int cardinal();
    Rayon obtenirRayon(int index);
    void ajouter(Rayon leRayon);
};

#endif // COLLECTIONRAYON_H
