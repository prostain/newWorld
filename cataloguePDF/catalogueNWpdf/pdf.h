#ifndef PDF_H
#define PDF_H

#include<iostream>
#include <QPdfWriter>
#include <QTextDocument>
using namespace std;


class Pdf
{
private:
    QPdfWriter *monPdfWriter;
    QString nomDocument;
    QString codeHTML;
    QTextDocument monTextDocument;
public:
    Pdf(QString docName);
    void ecrireTexte(QString texte);
    void chargerImage(QString image);
    void imprimer();
};

#endif // PDF_H
