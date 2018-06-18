#include "rayon.h"
#include "ui_rayon.h"
#include <QSqlQuery>
#include <QCheckBox>
#include <QMessageBox>

Rayon::Rayon(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Rayon)
{
    ui->setupUi(this);
    chargeListeRayon();
    ChargeTableauDemande();
    ChargeID();
}

Rayon::~Rayon()
{
    delete ui;
}

void Rayon::on_pushButtonProduitQuitter_clicked()
{
    reject();
}

void Rayon::chargeListeRayon()
{
    ui->listWidgetRayon->clear();
    QString txtRequete="select type from rayon where accept ";
    QSqlQuery maRequete(txtRequete);
     while(maRequete.next())
        {
            ui->listWidgetRayon->addItem(maRequete.value("type").toString());
        }

}

void Rayon::on_pushButtonAjouterRayon_clicked()
{
    QString txtRequete="insert into rayon values(?,?,1)";
    QSqlQuery maRequete(txtRequete);
    maRequete.addBindValue(ui->spinBoxNUmRayon->value());
    maRequete.addBindValue(ui->lineEditNomRayon->text());
    maRequete.exec();
    chargeListeRayon();
    ChargeID();

}

void Rayon::on_pushButtonEffacerRayon_clicked()
{
    QString txtRequete="delete from rayon where type=?";
    QSqlQuery maRequete(txtRequete);
    QString RayonSelectionner;
    for (int noRayon =0 ; noRayon<ui->listWidgetRayon->count() ; noRayon++)
    {
        if(ui->listWidgetRayon->item(noRayon)->isSelected())
            RayonSelectionner=ui->listWidgetRayon->item(noRayon)->text();
    }
    maRequete.addBindValue(RayonSelectionner);
    if(maRequete.exec()==false)
    {
        QMessageBox::warning(this,"error","La requete n'as pas put etre executer, atention il y a peut etre un produit lier au Rayon .");
    }
    chargeListeRayon();
}

void Rayon::ChargeTableauDemande()
{
    ui->tableWidgetRayon->clearContents();
    ui->tableWidgetRayon->setRowCount(0);

    QString txtRequete="select numerorayon,type from rayon where not Accept";
    QSqlQuery maRequete(txtRequete);
    while(maRequete.next())
    {
        QCheckBox* valider= new QCheckBox("Valider",ui->tableWidgetRayon);
        connect(valider,SIGNAL(stateChanged(int)),this,SLOT(validerDemande(int)));
        int nbLigne=ui->tableWidgetRayon->rowCount();
        ui->tableWidgetRayon->setRowCount(nbLigne+1);
        ui->tableWidgetRayon->setItem(nbLigne,0,new QTableWidgetItem(maRequete.value("numerorayon").toString()));
        ui->tableWidgetRayon->setItem(nbLigne,1,new QTableWidgetItem(maRequete.value("type").toString()));
        ui->tableWidgetRayon->setCellWidget(nbLigne,2,valider);

    }
}

void Rayon::ChargeID()
{
    QString txt="select MAX(numerorayon) max from rayon";
    QSqlQuery maRequete(txt);
    maRequete.next();
    int idMax=maRequete.value("max").toInt()+1;
    ui->spinBoxNUmRayon->setValue(idMax);
}


