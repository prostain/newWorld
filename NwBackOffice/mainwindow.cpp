#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSqlDatabase>  // nécessaire pour utiliser un QSqlDatabase
#include "produit.h"
#include "login.h"
#include "rayon.h"
#include "produit.h"
#include "typeproduit.h"
#include"deconnection.h"
#include <QSqlQuery>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    chargeTableauDemande();
}

MainWindow::~MainWindow()
{

}

void MainWindow::on_pushButtonProduit_clicked()
{
    Produit p;
    p.exec();


}

void MainWindow::on_pushButtonRayon_clicked()
{
    Rayon R;
    R.exec();
}


void MainWindow::on_pushButtonTypeProduits_clicked()
{
    TypeProduit T;
    T.exec();
}

void MainWindow::chargeTableauDemande()
{
    ui->tableWidgetnbDemande->clearContents();
    ui->tableWidgetnbDemande->setRowCount(0);
    QString nbDemandeProduit;
    QString nbDemandeRayon;
    QString nbDemandeTypeProduit;
    QString sectionProduit="Produit";
    QString sectionRayon="Rayon";
    QString sectionTypeProduit="Type Produit";
    QString txtProduit="select count(*) as nbDemande from produit where not accept";
    QString txtRayon="select count(*) as nbDemande from rayon where not accept";
    QString txtTypeProduit="select count(*) as nbDemande from characteristique where not accept";
    QSqlQuery nbRequeteProduit(txtProduit);
    nbRequeteProduit.next();
    nbDemandeProduit= nbRequeteProduit.value("nbDemande").toString();
    QSqlQuery nbRequeteRayon(txtRayon);
    nbRequeteRayon.next();
    nbDemandeRayon= nbRequeteRayon.value("nbDemande").toString();
    QSqlQuery nbRequeteTypeProduit(txtTypeProduit);
    nbRequeteTypeProduit.next();
    nbDemandeTypeProduit= nbRequeteTypeProduit.value("nbDemande").toString();
    if(nbDemandeProduit>0)
    {
        qDebug()<<nbDemandeProduit;
        int nbLigne= ui->tableWidgetnbDemande->rowCount();
        ui->tableWidgetnbDemande->setRowCount(nbLigne+1);
        ui->tableWidgetnbDemande->setItem(nbLigne,0, new QTableWidgetItem(nbDemandeProduit));
        ui->tableWidgetnbDemande->setItem(nbLigne,1, new QTableWidgetItem(sectionProduit));
    }
    if(nbDemandeRayon>0)
    {

        int nbLigne= ui->tableWidgetnbDemande->rowCount();
        ui->tableWidgetnbDemande->setRowCount(nbLigne+1);
        ui->tableWidgetnbDemande->setItem(nbLigne,0, new QTableWidgetItem(nbDemandeRayon));
        ui->tableWidgetnbDemande->setItem(nbLigne,1, new QTableWidgetItem(sectionRayon));
    }
    if(nbDemandeTypeProduit>0)
    {
        int nbLigne= ui->tableWidgetnbDemande->rowCount();
        ui->tableWidgetnbDemande->setRowCount(nbLigne+1);
        ui->tableWidgetnbDemande->setItem(nbLigne,0, new QTableWidgetItem(nbDemandeTypeProduit));
        ui->tableWidgetnbDemande->setItem(nbLigne,1, new QTableWidgetItem(sectionTypeProduit));
    }

}

void MainWindow::closeEvent(QCloseEvent *event)
{
    Deconnection D;
    if(D.exec()==QDialog::Accepted)
    {
        close();
    }
    else
        event->ignore();
}

