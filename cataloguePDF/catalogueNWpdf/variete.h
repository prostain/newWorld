#ifndef VARIETE_H
#define VARIETE_H
#include <iostream>
#include <QVariant>
using namespace std;

class Variete
{
    private:
        int varieteId;
        QString varieteLibelle;
        QString varieteImage;
        QString varieteDesc;
        float varietePU;
    public:
        Variete();
        Variete(int idVariete, QString libelleVariete, QString imageVariete , QString varieteDesc ,float varietePU);
        QString versChaine();
        QString getImage();
        int getId();
};

#endif // VARIETE_H
