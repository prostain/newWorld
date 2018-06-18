#ifndef DECONNECTION_H
#define DECONNECTION_H

#include <QDialog>

namespace Ui {
class Deconnection;
}

class Deconnection : public QDialog
{
    Q_OBJECT

public:
    explicit Deconnection(QWidget *parent = 0);
    ~Deconnection();

private slots:
    void on_pushButtonOui_clicked();

    void on_pushButtonNon_clicked();

private:
    Ui::Deconnection *ui;
};

#endif // DECONNECTION_H
