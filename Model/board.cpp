#include "board.h"
#include "tile.h"
#include "tile/street.h"
#include "tile/station.h"
#include "tile/utility.h"
#include "tile/special.h"
#include "tile/tax.h"
#include "tile/chancecardgenerator.h"
#include "tile/chancecard.h"

#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonValue>
#include <QDebug>


void hardProperties(QVector<Tile*> &tiles)
{
    tiles.resize(0);

    tiles.push_back(new Special(0,"Start", TileType::Tiles::Special));

    tiles.push_back(new Street(1, "Tężnie, Ciechocinek", TileType::Tiles::Street, 0, 0.6, QVector<float>({0.02, 0.1, 0.3, 0.9, 1.6, 2.5})));
    tiles.push_back(new ChanceCard(2, "Szansa", TileType::Tiles::Chance));
    tiles.push_back(new Street(3, "Kopalnia soli, Wieliczka", TileType::Tiles::Street, 0, 0.6, QVector<float>({0.04, 0.2, 0.6, 1.8, 3.2, 4.5})));
    tiles.push_back(new Tax(4, "Podatek Dochodowy", TileType::Tiles::Tax, 2));
    tiles.push_back(new Station(5, "Lotnisko im. Lecha Wałęsy, Gdańsk", TileType::Tiles::Station, 2));
    tiles.push_back(new Street(6, "Muzeum Zabawkarstwa, Kielce", TileType::Tiles::Street, 1, 1, QVector<float>({0.06, 0.3, 0.9, 2.7, 5.5})));
    tiles.push_back(new ChanceCard(7, "Szansa", TileType::Tiles::Chance));
    tiles.push_back(new Street(8, "Planetarium, Toruń", TileType::Tiles::Street, 1, 1, QVector<float>({0.06, 0.3, 0.9, 2.7, 5.5})));
    tiles.push_back(new Street(9, "Park Myślęcinek, Bydgoszcz", TileType::Tiles::Street, 1, 1.2, QVector<float>({0.08, 0.4, 1, 3, 4.5, 6})));

    tiles.push_back(new Special(10, "Więzienie", TileType::Tiles::Special));

    tiles.push_back(new Street(11, "Tor regatowy Malta, Poznań", TileType::Tiles::Street, 2, 1.4, QVector<float>({0.1, 0.5, 1.5, 4.5, 6.25, 7.5})));
    tiles.push_back(new Utility(12, "Wodociągi", TileType::Tiles::Utility, 2));
    tiles.push_back(new Street(13, "Wielka Krokiew, Zakopane", TileType::Tiles::Street, 2, 1.4, QVector<float>({0.1, 0.5, 1.5, 4.5, 6.25, 7.5})));
    tiles.push_back(new Street(14, "Stadion Śląski, Chorzów", TileType::Tiles::Street, 2, 1.6, QVector<float>({0.12, 0.6, 1.88, 5, 7, 9})));
    tiles.push_back(new Station(15, "Lotnisko Sadków, Radom", TileType::Tiles::Station, 2));
    tiles.push_back(new Street(16, "Panorama Racławicka, Wrocław", TileType::Tiles::Street, 3, 1.8, QVector<float>({0.14, 0.7, 2, 5.5, 7.5, 9.5})));
    tiles.push_back(new ChanceCard(17, "Szansa", TileType::Tiles::Chance));
    tiles.push_back(new Street(18, "Narodowa orkiestra symfoniczna PR, Katowice", TileType::Tiles::Street, 3, 1.8, QVector<float>({0.14, 0.7, 2, 5.5, 7.5, 9.5})));
    tiles.push_back(new Street(19, "Teatr Wielki Opera Narodowa, Warszawa", TileType::Tiles::Street, 3, 2, QVector<float>({0.16, 0.8, 2.2, 6, 8, 10})));

    tiles.push_back(new Special(20, "Darmowy parking", TileType::Tiles::Special));

    tiles.push_back(new Street(21, "Nowa huta", TileType::Tiles::Street, 4, 2.2, QVector<float>({0.18, 0.9, 2.5, 7, 8.75, 10.5})));
    tiles.push_back(new ChanceCard(22, "Szansa", TileType::Tiles::Chance));
    tiles.push_back(new Street(23, "Stocznia Gdańska", TileType::Tiles::Street, 4, 2.2, QVector<float>({0.18, 0.9, 2.5, 7, 8.75, 10.5})));
    tiles.push_back(new Street(24, "Pałac Kultury i Nauki, Warszawa", TileType::Tiles::Street, 4, 2.4, QVector<float>({0.2, 1, 3, 7.5, 9.25, 11})));
    tiles.push_back(new Station(25, "Lotnisko Balice im. Jana Pawła II, Kraków", TileType::Tiles::Station, 2));
    tiles.push_back(new Street(26, "Monciak - Molo, Sopot", TileType::Tiles::Street, 5, 2.6, QVector<float>({0.22, 1.1, 3.3, 8, 9.75, 11.5})));
    tiles.push_back(new Street(27, "Krupówki, Zakopane", TileType::Tiles::Street, 5, 2.6, QVector<float>({0.22, 1.1, 3.3, 8, 9.75, 11.5})));
    tiles.push_back(new Utility(28, "Elektrownia", TileType::Tiles::Utility, 2));
    tiles.push_back(new Street(29, "ul. Piotrkowska, Łódź", TileType::Tiles::Street, 5, 2.8, QVector<float>({0.24, 1.2, 3.6, 8.5, 10.25, 12})));

    tiles.push_back(new Special(30, "Idź do więzienia", TileType::Tiles::Special));

    tiles.push_back(new Street(31, "Słowiński Park Narodowy", TileType::Tiles::Street, 6, 3, QVector<float>({0.26, 1.3, 3.9, 9, 11, 12.75})));
    tiles.push_back(new Street(32, "Białowieski Park Narodowy", TileType::Tiles::Street, 6, 3, QVector<float>({0.26, 1.3, 3.9, 9, 11, 12.75})));
    tiles.push_back(new ChanceCard(33, "Kasa społeczna", TileType::Tiles::Chance));
    tiles.push_back(new Street(34, "Tatrzański Park Narodowy", TileType::Tiles::Street, 6, 3.2, QVector<float>({0.28, 1.5, 4.5, 10, 12, 14})));
    tiles.push_back(new Station(35, "Lotnisko im. Fryderyka Chopina, Warszawa", TileType::Tiles::Station, 2));
    tiles.push_back(new ChanceCard(36, "Szansa", TileType::Tiles::Chance));
    tiles.push_back(new Street(37, "Rynek główny, Kraków", TileType::Tiles::Street, 7, 3.5, QVector<float>({0.35, 1.75, 5, 11, 13, 15})));
    tiles.push_back(new Tax(38, "Domiar Podatkowy", TileType::Tiles::Tax, 1));
    tiles.push_back(new Street(39, "Trakt królewski, Warszawa", TileType::Tiles::Street, 7, 4, QVector<float>({0.5, 2, 6, 14, 17, 17})));
}

Board::Board(QObject *parent) : QObject(parent)
{

    try
    {
        cpindex = 0;
        m_dice = 0;
        //QVector<Tile*> tiles;
        m_tiles.resize(40);
        QString val;
        QFile file("properties.json");
        file.open(QIODevice::ReadOnly | QIODevice::Text);
        if(!file.exists()) throw QString("Board.cpp: File does not exists");
        else qDebug()  << "Board.cpp:" <<  "Found properties.json. Using it.";
        val = file.readAll();
        file.close();

        QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());

        if(d.isNull()) throw QString("JSON is invalid");
        if(d.isEmpty()) throw QString("JSON is empty");

        if(!d.object().contains(QString("Monopoly"))) throw QString("Cant find Monopoly object");
        QJsonObject mainObj = d.object().value(QString("Monopoly")).toObject();

        QVector<QJsonArray> prop;
        QVector<QString> propNames = {"Special", "Utility", "Chance", "Station", "Street", "Tax"};

        for(int i=0; i<propNames.size(); i++)
        {
            if(!mainObj.contains(QString(propNames[i]))) throw QString("Cant find "+propNames[i]+" object");
            else prop.push_back(mainObj.value(propNames[i]).toArray());
        }

        //qDebug() << prop[5][0];

        //special
        for(int i=0; i<prop[0].size(); i++)
        {
            QJsonObject current = prop[0][i].toObject();
            int id = current.value("id").toInt();
            QString name = current.value("name").toString();
            m_tiles[id] = new Special(id, name, TileType::Tiles::Special);
        }
        //utility
        for(int i=0; i<prop[1].size(); i++)
        {
            QJsonObject current = prop[1][i].toObject();
            int id = current.value("id").toInt();
            int price = current.value("price").toInt();
            QString name = current.value("name").toString();
            m_tiles[id] = new Utility(id, name, TileType::Tiles::Utility, price);
        }
        //chancecard
        for(int i=0; i<prop[2].size(); i++)
        {
            QJsonObject current = prop[2][i].toObject();
            int id = current.value("id").toInt();
            QString name = current.value("name").toString();
            m_tiles[id] = new ChanceCard(id, name, TileType::Tiles::Chance);
        }
        //station
        for(int i=0; i<prop[3].size(); i++)
        {
            QJsonObject current = prop[3][i].toObject();
            int id = current.value("id").toInt();
            int price = current.value("price").toInt();
            QString name = current.value("name").toString();
            m_tiles[id] = new Station(id, name, TileType::Tiles::Station, price);
        }
        //street
        for(int i=0; i<prop[4].size(); i++)
        {
            QJsonObject current = prop[4][i].toObject();
            int id = current.value("id").toInt();
            int price = current.value("price").toInt();
            QString name = current.value("name").toString();
            int color = Tile::colorToInt(current.value("color").toString());
            QJsonObject rents = current.value("rent").toObject();
            QVector<float> rent = {static_cast<float>(rents["empty"].toInt()), static_cast<float>(rents["one"].toInt()), static_cast<float>(rents["two"].toInt()), static_cast<float>(rents["three"].toInt()), static_cast<float>(rents["four"].toInt()), static_cast<float>(rents["hotel"].toInt())};
            //qDebug() << id << name << current.value("color").toString() << price << rent;
            m_tiles[id] = new Street(id, name, TileType::Tiles::Street, color, price, rent);
        }
        //tax
        for(int i=0; i<prop[5].size(); i++)
        {
            QJsonObject current = prop[5][i].toObject();
            int id = current.value("id").toInt();
            int price = current.value("value").toInt();
            QString name = current.value("name").toString();
            m_tiles[id] = new Tax(id, name, TileType::Tiles::Tax, price);
        }
        //        printing tiles
        //        for(int i=0; i<tiles.size();i++)
        //        {
        //            if(tiles[i] == NULL) qDebug() << i << "empty";
        //            else if(tiles[i]->Type() == TileType::Tiles::Street || tiles[i]->Type() == TileType::Tiles::Station || tiles[i]->Type() == TileType::Tiles::Utility)
        //            {
        //                Buyable *cur = dynamic_cast<Buyable*>(tiles[i]);
        //                qDebug() << cur->Index() << cur->Name() << cur->Price();
        //            }
        //            else
        //            {
        //                qDebug() << tiles[i]->Index() << tiles[i]->Name();
        //            }
        //        }

    }
    catch(QString error)
    {
        qDebug() << "Board.cpp:" << error;
        hardProperties(m_tiles);
    }
}

int Board::currentPlayerIndex()
{
    return cpindex;
}

int Board::Dice()
{
    return m_dice;
}
/*
void Board::initPlayers(QList<QString> list)
{
    int length = list.size();
    for(int i=0; i<length; i++)
    {
        this->m_players.push_back(new Player(i+1, list[i]));
    }
}
*/
void Board::setCurrentPlayerIndex(int value)
{
    if(cpindex != value)
    {
        cpindex = value;
        emit currentPlayerIndexChanged(value);
    }
}

void Board::setDice(int value)
{
    if(m_dice != value)
    {
        m_dice = value;
        DiceChanged(value);
    }
}

void Board::addPlayer(QString name)
{
    int index = m_players.size();
    qDebug()  << "Board.cpp:" <<  index << name;
    m_players.push_back(new Player(index, name));
}

Player *Board::player(int index)
{
    return m_players[index];
}

Tile *Board::tile(int index)
{
    return m_tiles[index];
}
