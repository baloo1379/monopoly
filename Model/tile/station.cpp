#include <QDebug>
#include "station.h"

Station::Station(int index, QString name, TileType::Tiles type, int price, QObject *parent)
 : Buyable(index, name, type, price, parent)
{
    rent.resize(4);
    rent[0] = price/4;
    rent[1] = price/2;
    rent[2] = price*3/4;
    rent[3] = price;
}

Station::Station(QObject *parent)
 : Buyable(0, "", TileType::Tiles::Empty, 0, parent)
{
    rent.resize(4);
    rent[0] = 0;
    rent[1] = 0;
    rent[2] = 0;
    rent[3] = 0;
}

Station::Station(Station &station)
 : Buyable(station.index, station.name, TileType::Tiles::Station, station.price)
{
    rent = station.rent;
}

int Station::RentW1S()
{
    return rent[0];
}
int Station::RentW2S()
{
    return rent[1];
}
int Station::RentW3S()
{
    return rent[2];
}
int Station::RentW4S()
{
    return rent[3];
}

QString Station::actOnPlayer(Player *player)
{
    qDebug() << "Acting on the station"<< Name();
    if(Owner() == nullptr)
    {
        qDebug() << "No owner";
        return Name() + " jest dostępny.";
    }
    else if (Owner()->Index() == player->Index()) {
        qDebug() << player->Name() << "is the owner.";
        return Name() + " jest twoja.";
    }
    else
    {
        qDebug() << "rent" << Owner()->Stations();

        int rentToPay = rent[Owner()->Stations()-1];

        player->setMoney(-rentToPay);
        Owner()->setMoney(rentToPay);
        return Name() + " posiada " + Owner()->Name() + ". " + player->Name() + " płaci $" + QString::number(rentToPay) + " czynszu.";
    }
}
