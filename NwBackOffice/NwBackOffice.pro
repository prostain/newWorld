#-------------------------------------------------
#
# Project created by QtCreator 2017-11-17T10:22:36
#
#-------------------------------------------------

QT       += core gui
QT       += sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = NwBackOffice
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    login.cpp \
    produit.cpp \
    rayon.cpp \
    typeproduit.cpp \
    deconnection.cpp

HEADERS  += mainwindow.h \
    login.h \
    produit.h \
    rayon.h \
    typeproduit.h \
    deconnection.h

FORMS    += mainwindow.ui \
    login.ui \
    produit.ui \
    rayon.ui \
    typeproduit.ui \
    deconnection.ui

RESOURCES += \
    nWBackOffice.qrc
