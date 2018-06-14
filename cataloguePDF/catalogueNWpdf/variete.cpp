#include "variete.h"
#include "QDebug"

Variete::Variete()
{
}

Variete::Variete(int idVariete, QString libelleVariete, QString imageVariete, QString varieteDesc , float varietePU)
{
    qDebug()<<"Variete::Variete(int idVariete, QString libelleVariete, QString imageVariete)";
    varieteId=idVariete;
    varieteLibelle=libelleVariete;
    varieteImage=imageVariete;
    this->varieteDesc=varieteDesc;
    this->varietePU=varietePU;
}

QString Variete::versChaine()
{
    qDebug()<<"QString Variete::versChaine()";
    QString resultat;
    resultat+="<div><p>"+varieteLibelle+"<br>"+QString::number(varietePU)+" € Unitée <br>"+varieteDesc+"</p></div>";
    return resultat;
}

QString Variete::getImage()
{
    return varieteImage;
}

int Variete::getId()
{
    return varieteId;
}
