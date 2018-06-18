#include <QGuiApplication>
#include <QSqlDatabase>
#include <pdf.h>
#include <passerelle.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    QSqlDatabase maBase;
    maBase=QSqlDatabase::addDatabase("QMYSQL");
    maBase.setHostName("localhost");
    maBase.setDatabaseName("newWorld");
    maBase.setUserName("root");
    maBase.setPassword("passf203");
    if(maBase.open())
    {
        Pdf monPdf("catalogueNW.pdf");
        CollectionRayon mesRayons =Passerelle::chargerLesRayons();
        int nbRayon=mesRayons.cardinal();
        qDebug()<<nbRayon;
        for(int numRayon=1 ; numRayon <= nbRayon ; numRayon++)
        {

          Rayon leRayon=mesRayons.obtenirRayon(numRayon);
          QString rayon=leRayon.versChaine();
          CollectionProduit mesProduits =Passerelle::chargerLesProduits(leRayon.getId());
          int nbProduit=mesProduits.cardinal();
          qDebug()<<nbProduit;
          if(nbProduit>0)
          {

              monPdf.ecrireTexte(rayon);
              for(int numProduit=1 ; numProduit<=nbProduit ; numProduit++)
              {
                  Produit leProduit=mesProduits.ObtenirProduit(numProduit);
                  QString produit=leProduit.versChaine();
                  CollectionVariete mesVarietes =Passerelle::chargerLesVarietes(leProduit.getId());
                  int nbVariete=mesVarietes.cardinal();
                  qDebug()<<nbVariete;
                  if (nbVariete>0)
                  {
                     monPdf.ecrireTexte(produit);

                      for(int numVariete=1 ; numVariete<=nbVariete ; numVariete++)
                      {
                          Variete laVariete=mesVarietes.ObtenirVariete(numVariete);
                          QString imgVariete=laVariete.getImage();
                          QString variete=laVariete.versChaine();
                          monPdf.chargerImage(imgVariete);
                          monPdf.ecrireTexte(variete);
                      }
                  }
              }
          }
        }
        monPdf.imprimer();

        return a.exec();
    }
}
