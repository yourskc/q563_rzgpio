#ifndef RZGPIO_H
#define RZGPIO_H

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <string>
#include <iostream>

#include <QObject>
#include <qqml.h>

#define PMOD0_7    0
#define PMOD0_8    1
#define PMOD0_9    2
#define PMOD0_10   3

#define PMOD1_7    4
#define PMOD1_8    5
#define PMOD1_9    6
#define PMOD1_10   7

#define MAX_GPIO_Ns 8

struct GPIO {
    int port;
    long pin;
    const char *direction;
    const char *ID;
    const char *name;
};

class RzGPIO : public QObject
{
Q_OBJECT
// QML_ELEMENT
Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)

public:
explicit     RzGPIO(QObject *parent);
struct GPIO Gpio[MAX_GPIO_Ns];

QString userName();
void setUserName(const QString &userName);


public slots: // slots are public methods available in QML
 void doSomething(const QString &text);
 void Init();
 void Init_GPIO();
 void Write(int n, int Value);
 int Read(int n);

signals:
    void userNameChanged();

private:
    QString m_userName;


};



#endif // RZGPIO_H
