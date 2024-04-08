#include <QtGui>
#include <QtQml>
#include <QQmlContext>
#include "testingtxt.h"

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);
//   QUrl source(QStringLiteral("qrc:/view/main.qml"));
  QUrl source(QStringLiteral("qrc:/view/GridExample.qml"));
  TestingTxt testingTxt;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("TestingTxt",&testingTxt);
    engine.load(source);
    return app.exec();
}
