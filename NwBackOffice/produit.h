#ifndef PRODUIT_H
#define PRODUIT_H

#include <QDialog>

namespace Ui {
class Produit;
}

class Produit : public QDialog
{
    Q_OBJECT

public:
    explicit Produit(QWidget *parent = 0);
    ~Produit();

private slots:
    void chargeID();
    void chargeListeProduit();
    void ChangementConstruct();
    void chargeTableauDemande();
    void validerDemande(int cocher);
    void on_pushButtonProduitQuitter_clicked();
    void ChargementDuComboBoxRayon();
    void ChargementDuComboBoxType();
    void ChargementDuComboBoxMesure();
    void ChargementDuComboBoxProducteur();
    void ChargementDuComboBoxLot();

    void on_pushButtonAjouterProduit_clicked();

private:
    Ui::Produit *ui;
};

#endif // PRODUIT_H
