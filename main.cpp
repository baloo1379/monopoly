#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore>
#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonValue>

#include "Model/player.h"
#include "Model/tile.h"
#include "Model/enums.h"
#include "Model/tile/street.h"
#include "Model/tile/station.h"
#include "Model/tile/utility.h"
#include "Model/tile/special.h"
#include "Model/tile/tax.h"
#include "Model/tile/chancecardgenerator.h"
#include "Model/tile/chancecard.h"
#include "Model/board.h"
#include "Model/gamewizardform.h"

int main(int argc, char *argv[])
{
    qsrand(time(NULL));
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;

    GameWizardForm form;

    Board board;

    qmlRegisterType<Player>("Monopoly.Player", 1, 0, "Player");
    qmlRegisterUncreatableType<Tile>("Monopoly.Tile", 1, 0, "Tile", "Abstract Tile");
    qmlRegisterUncreatableType<Buyable>("Monopoly.Buyable", 1, 0, "Buyable", "Abstract Buyable Tile");
    qmlRegisterType<Station>("Monopoly.Station", 1, 0, "Station");
    qmlRegisterType<Street>("Monopoly.Street", 1, 0, "Street");
    qmlRegisterType<Utility>("Monopoly.Utility", 1, 0, "Utility");
    qmlRegisterType<ChanceCard>("Monopoly.ChanceCard", 1, 0, "ChanceCard");
    qmlRegisterType<Special>("Monopoly.Special", 1, 0, "Special");
    qmlRegisterType<Tax>("Monopoly.Tax", 1, 0, "Tax");
    qmlRegisterType<TileType>("Monopoly.TileType", 1, 0, "TileType");
    qmlRegisterType<NeighbourHoodType>("Monopoly.NeighbourHoodType", 1, 0, "NeighbourHoodType");

    engine.rootContext()->setContextProperty("form", &form);
    engine.rootContext()->setContextProperty("board", &board);

    //engine.load(QUrl(QStringLiteral("qrc:/DevView.qml")));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}
