#include "produit.h"
#include "QDebug"

Produit::Produit()
{
}

Produit::Produit(int idProduit, QString libelleProduit)
{
    qDebug()<<"Produit::Produit(int idProduit, QString libelleProduit)";
    produitId=idProduit;
    produitLibelle=libelleProduit;
}

QString Produit::versChaine()
{
    qDebug()<<"QString Produit::versChaine()";
    QString resultat;
    resultat="<h3 style=\"text-align:center;\">"+produitLibelle+"</h3>";
    return resultat;
}

int Produit::getId()
{
    return produitId;
}
