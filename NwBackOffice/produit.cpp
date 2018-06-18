#include "produit.h"
#include "ui_produit.h"
#include <QSqlQuery>
#include <QCheckBox>
#include <QDebug>

Produit::Produit(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Produit)
{
    ui->setupUi(this);
    ChangementConstruct();
}

Produit::~Produit()
{
    delete ui;
}

void Produit::chargeID()
{
    QString txt="select MAX(numeroproduit) max from produit";
    QSqlQuery maRequete(txt);
    maRequete.next();
    int idMax=maRequete.value("max").toInt()+1;
    qDebug()<<idMax;
    ui->spinBoxNumProduit->setValue(idMax);
}

void Produit::chargeListeProduit()
{
    ui->tableWidgetListProduit->clearContents();
    ui->tableWidgetListProduit->setRowCount(0);
    QString txtRequete="select libelleproduit ,numeroproduit from produit where Accept";
    QSqlQuery maRequete(txtRequete);
    while(maRequete.next())
        {
            int nbLigne=ui->tableWidgetListProduit->rowCount();
            ui->tableWidgetListProduit->setRowCount(nbLigne+1);
            ui->tableWidgetListProduit->setItem(nbLigne,0,new QTableWidgetItem(maRequete.value("numeroproduit").toString()));
            ui->tableWidgetListProduit->setItem(nbLigne,1,new QTableWidgetItem(maRequete.value("libelleproduit").toString()));
        }
}

void Produit::ChangementConstruct()
{
    chargeID();
    chargeListeProduit();
    chargeTableauDemande();
    ChargementDuComboBoxRayon();
    ChargementDuComboBoxType();
    ChargementDuComboBoxMesure();
    ChargementDuComboBoxProducteur();
    ChargementDuComboBoxLot();
}

void Produit::chargeTableauDemande()
{
    ui->tableWidgetDemandeProduit->clearContents();
    ui->tableWidgetDemandeProduit->setRowCount(0);

    QString txtRequete="select numeroproduit,libelleproduit,prixU,mesure,numerocharacteristique,numerolot,iDProducteur,numerorayon from produit where not Accept";
    QSqlQuery maRequete(txtRequete);
    while(maRequete.next())
    {
        QCheckBox* valider= new QCheckBox("Valider",ui->tableWidgetDemandeProduit);
        connect(valider,SIGNAL(stateChanged(int)),this,SLOT(validerDemande(int)));
        int nbLigne=ui->tableWidgetDemandeProduit->rowCount();
        ui->tableWidgetDemandeProduit->setRowCount(nbLigne+1);
        ui->tableWidgetDemandeProduit->setItem(nbLigne,0,new QTableWidgetItem(maRequete.value("numeroproduit").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,1,new QTableWidgetItem(maRequete.value("libelleproduit").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,2,new QTableWidgetItem(maRequete.value("prixU").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,3,new QTableWidgetItem(maRequete.value("mesure").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,4,new QTableWidgetItem(maRequete.value("numerocharacteristique").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,5,new QTableWidgetItem(maRequete.value("numerolot").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,6,new QTableWidgetItem(maRequete.value("iDProducteur").toString()));
        ui->tableWidgetDemandeProduit->setItem(nbLigne,7,new QTableWidgetItem(maRequete.value("numerorayon").toString()));
        ui->tableWidgetDemandeProduit->setCellWidget(nbLigne,8,valider);

    }




}

void Produit::validerDemande(int cocher)
{
    int ligne;
    if (cocher==Qt::Checked)
    {
      for ( int noLigne ; noLigne<ui->tableWidgetDemandeProduit->rowCount() ; noLigne++)
      {
          //if(ui->tableWidgetDemandeProduit->item(noLigne,8)->is)
      }

    }

}

void Produit::on_pushButtonProduitQuitter_clicked()
{
    reject();
}

void Produit::ChargementDuComboBoxRayon()
{
    QString txt="select type , numerorayon from rayon where accept";
    QSqlQuery maRequete(txt);
    while(maRequete.next())
    {
        ui->comboBoxRayon->addItem(maRequete.value("type").toString(),maRequete.value("numerorayon").toString());
    }
}

void Produit::ChargementDuComboBoxType()
{
    QString txt="select libellecharacteristique, numerocharacteristique from characteristique where accept";
    QSqlQuery maRequete(txt);
    while(maRequete.next())
    {
        ui->comboBoxTypeProduit->addItem(maRequete.value("libellecharacteristique").toString(),maRequete.value("numerocharacteristique").toString());
    }
}

void Produit::ChargementDuComboBoxMesure()
{
    QString txt="select distinct mesure from produit";
    QSqlQuery maRequete(txt);
    while(maRequete.next())
    {
        ui->comboBoxMesure->addItem(maRequete.value("mesure").toString());
    }
}

void Produit::ChargementDuComboBoxProducteur()
{
    QString txt="select distinct nomProd , prenomProd,iDProducteur from Producteur";
    QSqlQuery maRequete(txt);
    while(maRequete.next())
    {
        ui->comboBoxProducteur->addItem(maRequete.value("nomProd").toString()+""+maRequete.value("prenomProd").toString(),maRequete.value("iDProducteur").toString());
    }
}

void Produit::ChargementDuComboBoxLot()
{
    QString txt="select distinct libellelot , numerolot from lot";
    QSqlQuery maRequete(txt);
    while(maRequete.next())
    {
        ui->comboBoxLot->addItem(maRequete.value("lot").toString(),maRequete.value("numerolot").toString());
    }
}

void Produit::on_pushButtonAjouterProduit_clicked()
{
    QString txtRequete="insert into produit values(?,?,?,?,?,?,?,?,1)";
    QSqlQuery maRequete(txtRequete);
    maRequete.addBindValue(ui->spinBoxNumProduit->value());
    maRequete.addBindValue(ui->lineEditNomProd->text());
    maRequete.addBindValue(ui->doubleSpinBoxPU->value());
    maRequete.addBindValue(ui->comboBoxMesure->currentText());
    maRequete.addBindValue(ui->comboBoxTypeProduit->currentData().toString());
    maRequete.addBindValue(ui->comboBoxLot->currentData().toString());
    maRequete.addBindValue(ui->comboBoxProducteur->currentData().toString());
    maRequete.addBindValue(ui->comboBoxRayon->currentData().toString());
    maRequete.exec();
    chargeListeProduit();
    chargeID();

}

