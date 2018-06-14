#include "jeuenregistrement.h"
JeuEnregistrement::JeuEnregistrement(QString txtRequete)
{
    maRequete.exec(txtRequete);
}

bool JeuEnregistrement::suivant()
{
    return maRequete.next();
}

bool JeuEnregistrement::fin()
{

    //return maRequete.last();
    return false;
}

QVariant JeuEnregistrement::getValeur(QString monChamp)
{
    return maRequete.value(monChamp);

}

void JeuEnregistrement::fermer()
{
    maRequete.finish();
}
