#include "mainwindow.h"
#include <QApplication>
#include "login.h"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QSqlDatabase maBase;
    maBase=QSqlDatabase::addDatabase("QMYSQL");
    maBase.setHostName("localhost");
    maBase.setDatabaseName("newWorld");
    maBase.setUserName("root");
    maBase.setPassword("passf203");
    maBase.open();
    login MesLog;
    if(MesLog.exec()==QDialog::Accepted)
    {
        MainWindow w;
        w.show();

        return a.exec();
     }
    maBase.close();
}
