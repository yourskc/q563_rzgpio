TEMPLATE = app

QT += qml quick

CONFIG += c++11 qmltypes

SOURCES += main.cpp \
    rzgpio.cpp

RESOURCES += qml.qrc

QML_IMPORT_NAME = io.qt.examples.rzgpio
QML_IMPORT_MAJOR_VERSION = 1
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    rzgpio.h
