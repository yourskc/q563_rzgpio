#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <rzgpio.h>
#include <QQmlContext>
#include <QtQml/qqml.h>
// #include <QtDeclarative>
// https://doc.qt.io/qt-5/qtquick-porting-qt5.html, deprecated
#include <QQmlComponent>
#include <QQuickItem>

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    RzGPIO* rzgpio = new RzGPIO(&engine);
    // Skc skc(&app);
    // engine.rootContext()->setContextProperty("RsGPIO", rsgpio);

    rzgpio->doSomething("by main.cpp");
    rzgpio->setUserName("SKC");

    QQmlContext* context = engine.rootContext();
    context->setContextProperty("RzGPIO", rzgpio);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
