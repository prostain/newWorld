#include "collectionproduit.h"

CollectionProduit::CollectionProduit()
{
}

int CollectionProduit::cardinal()
{
    return vectMesProduit.size();
}

Produit CollectionProduit::ObtenirProduit(int index)
{
    return vectMesProduit[index-1];
}

void CollectionProduit::ajouter(Produit leProduit)
{
    vectMesProduit.push_back(leProduit);

}
