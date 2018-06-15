#ifndef LOGIN_H
#define LOGIN_H

#include <QDialog>
#include <QSqlDatabase>

namespace Ui {
class login;
}

class login : public QDialog
{
    Q_OBJECT

public:
    QString MyLog;
    explicit login(QWidget *parent = 0);
    ~login();

private slots:
    void on_pushButtonValider_clicked();

    void on_pushButtonAnnuler_clicked();


    void on_lineEditLogin_textChanged(const QString &arg1);

    void on_lineEditPassword_textChanged(const QString &arg1);

    void ajoutConstruct();
private:
    Ui::login *ui;
};

#endif // LOGIN_H
