#include "collectionvariete.h"

CollectionVariete::CollectionVariete()
{
}

int CollectionVariete::cardinal()
{
     return vectMesVarietes.size();
}

Variete CollectionVariete::ObtenirVariete(int index)
{
    return vectMesVarietes[index-1];
}

void CollectionVariete::ajouter(Variete laVariete)
{
    vectMesVarietes.push_back(laVariete);
}
