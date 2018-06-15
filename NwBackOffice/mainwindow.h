#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSqlDatabase>
#include <QCloseEvent>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);

    ~MainWindow();

private slots:
    void on_pushButtonProduit_clicked();

    void on_pushButtonRayon_clicked();

    void on_pushButtonTypeProduits_clicked();

    void chargeTableauDemande();

private:
    Ui::MainWindow *ui;
    void closeEvent(QCloseEvent *event);

};

#endif // MAINWINDOW_H
