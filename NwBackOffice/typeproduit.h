#ifndef TYPEPRODUIT_H
#define TYPEPRODUIT_H

#include <QDialog>

namespace Ui {
class TypeProduit;
}

class TypeProduit : public QDialog
{
    Q_OBJECT

public:
    explicit TypeProduit(QWidget *parent = 0);
    ~TypeProduit();

private slots:


    void on_pushButtonTypeProduitQuitter_clicked();

    void on_pushButtonAjouterTypeProd_clicked();

    void chargeListTypeProduit();

    void chargeTableauDemande();

    void inTheConstructor();

    void chargeComboBoxMDP();
    void on_pushButton_clicked();

    void chargeId();

private:
    Ui::TypeProduit *ui;
};

#endif // TYPEPRODUIT_H
