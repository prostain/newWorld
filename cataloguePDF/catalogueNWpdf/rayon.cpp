#include "rayon.h"
#include "QDebug"

Rayon::Rayon()
{}

Rayon::Rayon(int idRayon, QString libelleRayon)
{
    qDebug()<<"Rayon::Rayon(int idRayon, QString libelleRayon)";
    rayonId=idRayon;
    rayonLibelle=libelleRayon;
}

QString Rayon::versChaine()
{
    qDebug()<<"QString Rayon::versChaine()";
    QString resultat;
    resultat="<h2 style=\"text-align:center;\">"+rayonLibelle+"</h2>";
    return resultat;
}

int Rayon::getId()
{
    return rayonId;
}
