#include "pdf.h"
#include <QDebug>

Pdf::Pdf(QString docName)
{
    nomDocument=docName;
    codeHTML="<!doctype html><html lang=\"fr\"><head><meta charset=\"utf-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"/home/prostain/Documents/git-newWorld/cataloguePDF/catalogueNWpdf/pdf.css\"><title>"+nomDocument+"</title></head><body><div class=\"titre\" align=center><h1>Catalogue NEW WORLD</h1></div>";
    monPdfWriter=new QPdfWriter(docName);
}

void Pdf::ecrireTexte(QString texte)
{
    codeHTML+="<br><p>"+texte+"</p><br>";
}

void Pdf::chargerImage(QString image)
{
    codeHTML+="<img src=../"+image+"><br>";
}

void Pdf::imprimer()
{
  codeHTML+="</body></html>";
  qDebug()<<codeHTML;
  monTextDocument.setHtml(codeHTML);
  monTextDocument.print(monPdfWriter);
}
