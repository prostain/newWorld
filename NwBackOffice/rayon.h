#ifndef RAYON_H
#define RAYON_H

#include <QDialog>

namespace Ui {
class Rayon;
}

class Rayon : public QDialog
{
    Q_OBJECT

public:
    explicit Rayon(QWidget *parent = 0);
    ~Rayon();

private slots:
    void on_pushButtonProduitQuitter_clicked();
    void chargeListeRayon();
    void on_pushButtonAjouterRayon_clicked();

    void on_pushButtonEffacerRayon_clicked();
    void ChargeTableauDemande();

    void ChargeID();
private:
    Ui::Rayon *ui;
};

#endif // RAYON_H
