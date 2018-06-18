#include "deconnection.h"
#include "ui_deconnection.h"

Deconnection::Deconnection(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Deconnection)
{
    ui->setupUi(this);
}

Deconnection::~Deconnection()
{
    delete ui;
}

void Deconnection::on_pushButtonOui_clicked()
{
    accept();
}

void Deconnection::on_pushButtonNon_clicked()
{
    reject();
}
