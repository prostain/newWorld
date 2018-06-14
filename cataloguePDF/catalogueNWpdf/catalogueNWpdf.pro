#-------------------------------------------------
#
# Project created by QtCreator 2018-04-06T08:50:19
#
#-------------------------------------------------

QT       += core

QT       += gui

QT       += sql



TARGET = catalogueNWpdf
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    variete.cpp \
    rayon.cpp \
    produit.cpp \
    pdf.cpp \
    passerelle.cpp \
    jeuenregistrement.cpp \
    collectionvariete.cpp \
    collectionrayon.cpp \
    collectionproduit.cpp

HEADERS += \
    variete.h \
    rayon.h \
    produit.h \
    pdf.h \
    passerelle.h \
    jeuenregistrement.h \
    collectionvariete.h \
    collectionrayon.h \
    collectionproduit.h
