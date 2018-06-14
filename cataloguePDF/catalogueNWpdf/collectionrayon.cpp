#include "collectionrayon.h"

CollectionRayon::CollectionRayon()
{
}

int CollectionRayon::cardinal()
{
    return vectMesRayons.size();
}

Rayon CollectionRayon::obtenirRayon(int index)
{
    return vectMesRayons[index-1];
}

void CollectionRayon::ajouter(Rayon leRayon)
{
    vectMesRayons.push_back(leRayon);
}
