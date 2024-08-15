#include "rzgpio.h"
#include <QDebug>
using namespace std;
// https://blog.felgo.com/cross-platform-app-development/how-to-expose-a-qt-cpp-class-with-signals-and-slots-to-qml
// PMOD0 (#7-#10)-Led:  ( -, P43_2(466), P41_0(448), - )
// PMOD1 (#7-#10)-Btn:  ( -, P5_2(162), P42_4(460), P47_2(498) )

RzGPIO::RzGPIO(QObject *parent):
    QObject(parent) {
// ID = Port x 8 + pin + 120
// ex. P42_4, ID = 42 x 8 + 4 + 120 = 460

  Init();

}

void RzGPIO::Init()
{

    Init_GPIO();

    // Export the desired pin by writing to /sys/class/gpio/export
    int fd;
    int fd1 = open("/sys/class/gpio/export", O_WRONLY);
    if (fd1 != -1) {

     struct stat sb;

     for ( int n = 0 ; n < MAX_GPIO_Ns ; n++ ) {
     if ( Gpio[n].port > 0 ) {

     char r[100];
     strcpy(r,"/sys/class/gpio/");
     strcat(r,Gpio[n].name);
     int ret = stat(r, &sb);
     if ( ret != 0 )
         if (write(fd1, Gpio[n].ID, 3) == 3) {
         // need a little delay
         usleep(100000);
         strcat(r,"/direction");
         int fd = open(r, O_WRONLY);
         if (fd != -1) {
            write(fd, Gpio[n].direction, strlen(Gpio[n].direction));
         }
       }
     }
    }
         close(fd1);
         close(fd);

    }
    Write(1, 0);
    Write(2, 0);
}

void RzGPIO::Init_GPIO()
{

Gpio[PMOD0_7].port = 0; // not used

Gpio[PMOD0_8].port = 43;
Gpio[PMOD0_8].pin = 2;
Gpio[PMOD0_8].ID = "466";
Gpio[PMOD0_8].name = "P43_2";
Gpio[PMOD0_8].direction = "out";

Gpio[PMOD0_9].port = 41;
Gpio[PMOD0_9].pin = 0;
Gpio[PMOD0_9].ID = "448";
Gpio[PMOD0_9].name = "P41_0";
Gpio[PMOD0_9].direction = "out";

Gpio[PMOD0_10].port = 0; // not used

Gpio[PMOD1_7].port = 0; // not used

Gpio[PMOD1_8].port = 5;
Gpio[PMOD1_8].pin = 2;
Gpio[PMOD1_8].ID = "162";
Gpio[PMOD1_8].name = "P5_2";
Gpio[PMOD1_8].direction = "in";

Gpio[PMOD1_9].port = 42;
Gpio[PMOD1_9].pin = 4;
Gpio[PMOD1_9].ID = "460";
Gpio[PMOD1_9].name = "P42_4";
Gpio[PMOD1_9].direction = "in";

Gpio[PMOD1_10].port = 47;
Gpio[PMOD1_10].pin = 2;
Gpio[PMOD1_10].ID = "498";
Gpio[PMOD1_10].name = "P47_2";
Gpio[PMOD1_10].direction = "in";


}
void RzGPIO::Write(int n, int Value)
{
    char r[100];
    strcpy(r,"/sys/class/gpio/");
    strcat(r,Gpio[n].name);
    strcat(r,"/value");
 qDebug() << "Write " << Gpio[n].name << "=" << Value;

    int fd = open(r, O_WRONLY);
    if (fd != -1) {         
std::string s = std::to_string(Value);
char const *pchar = s.c_str();    
        if (write(fd, pchar, 1) != 1) {
            perror("Error writing to value");

        }
    }

    close(fd);

}


int RzGPIO::Read(int n)
{
    int ret = 0 ;
    char r[100];
    strcpy(r,"/sys/class/gpio/");
    strcat(r,Gpio[n].name);
    strcat(r,"/value");

    int fd = open(r, O_RDONLY);
    if (fd != -1) {         \
// std::string s = std::to_string(Value);
char pchar[]="0";
    read(fd, pchar, 1);
    ret = atoi(pchar);

    }
    close(fd);
    return ret;
}



void RzGPIO::doSomething(const QString &text) {
 qDebug() << "skc doSomething" << text;
}
QString RzGPIO::userName()
{
    return m_userName;
}

void RzGPIO::setUserName(const QString &userName)
{
    if (userName == m_userName)
        return;

    m_userName = userName;
    emit userNameChanged();
}
