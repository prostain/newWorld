#include "login.h"
#include "ui_login.h"
#include <QSqlDatabase>  // nécessaire pour utiliser un QSqlDatabase
#include <QSqlTableModel> // nécessaire pour utiliser un QSqlTableModel
#include <QMessageBox> // nécessaire pour utiliser un QMessageBox
#include <QSqlQuery>
#include<QDebug>

login::login(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::login)
{
    ui->setupUi(this);
    ajoutConstruct();

}

login::~login()
{
    delete ui;
}

void login::on_pushButtonValider_clicked()
{
    QString monTexte="select EmployeId from Employe where EmployeLogin='"+ui->lineEditLogin->text()+"' and EmployeMdp='"+ui->lineEditPassword->text()+"'";
    QSqlQuery maRequete(monTexte);

    maRequete.next();
    qDebug()<<maRequete.value("EmployeId");
    if (maRequete.value("EmployeId")!="")
    {
        MyLog=ui->lineEditLogin->text();
        accept();
    }
    else
    {
        ui->labelErreurIcon->show();
        ui->labelErreurText->show();
        ui->lineEditLogin->clear();
        ui->lineEditPassword->clear();
    }
 }

void login::on_pushButtonAnnuler_clicked()
{
    reject();
}


void login::on_lineEditLogin_textChanged(const QString &arg1)
{
    if (arg1!="" and ui->lineEditPassword->text()!="")
    {
        ui->pushButtonValider->setEnabled(1);
    }
    else
    {
        ui->pushButtonValider->setEnabled(0);
    }
}

void login::on_lineEditPassword_textChanged(const QString &arg1)
{
    if (arg1!="" and ui->lineEditLogin->text()!="")
    {
        ui->pushButtonValider->setEnabled(1);
    }
    else
    {
        ui->pushButtonValider->setEnabled(0);
    }
}

void login::ajoutConstruct()
{
    //a effacer juste pour ce loger directement
    ui->lineEditLogin->setText("k");
    ui->lineEditPassword->setText("k");
    on_pushButtonValider_clicked();
    // vrai ajout au constructeur
    ui->labelErreurIcon->hide();
    ui->labelErreurText->hide();
}
