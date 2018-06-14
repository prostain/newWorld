#include "passerelle.h"
#include "QDebug"

Passerelle::Passerelle()
{
}

CollectionVariete Passerelle::chargerLesVarietes(int idProduit)
{
    qDebug()<<"CollectionVariete Passerelle::chargerLesVarietes()";
    CollectionVariete mesVarietes;
    QString laRequete="SELECT idLot, libelleVariete, descVariete, prix, photo FROM lot inner join variete on lot.idVariete = variete.idVariete where idProduit ="+QString::number(idProduit)+" AND validiteVariete = 1;";
    qDebug()<<laRequete;
    JeuEnregistrement monJeu(laRequete);
    while(monJeu.suivant())
    {
        int idVariete=monJeu.getValeur("idLot").toInt();
        QString libelleVariete=monJeu.getValeur("libelleVariete").toString();
        QString imageVariete=monJeu.getValeur("photo").toString();
        float puVariete=monJeu.getValeur("prix").toFloat();
        QString descVariete=monJeu.getValeur("descVariete").toString();
        Variete laVariete(idVariete,libelleVariete,imageVariete,descVariete,puVariete);
        mesVarietes.ajouter(laVariete);
    }
    return mesVarietes;
}

CollectionProduit Passerelle::chargerLesProduits(int idRayon)
{
    qDebug()<<"CollectionProduit Passerelle::chargerLesProduits()";
    CollectionProduit mesProduits;
    QString laRequete="SELECT idProduit,libelleProduit FROM produit where idRayon ="+QString::number(idRayon)+" AND validiteProduit = 1 ;";
    qDebug()<<laRequete;
    JeuEnregistrement monJeu(laRequete);
    while(monJeu.suivant())
    {
        int idProduit=monJeu.getValeur("idProduit").toInt();
        QString libelleProduit=monJeu.getValeur("libelleProduit").toString();
        Produit laProduit(idProduit,libelleProduit);
        mesProduits.ajouter(laProduit);
    }
    return mesProduits;
}

CollectionRayon Passerelle::chargerLesRayons()
{
    qDebug()<<"CollectionRayon Passerelle::chargerLesRayons()";
    CollectionRayon mesRayons;
    QString laRequete="SELECT idRayon,libelleRayon FROM rayon;";
    qDebug()<<laRequete;
    JeuEnregistrement monJeu(laRequete);
    while(monJeu.suivant())
    {
        int idRayon=monJeu.getValeur("idRayon").toInt();
        QString libelleRayon=monJeu.getValeur("libelleRayon").toString();
        Rayon laRayon(idRayon,libelleRayon);
        mesRayons.ajouter(laRayon);
    }
    return mesRayons;
}
