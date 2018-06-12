#ifndef STATION_H
#define STATION_H
#include "../tile.h"

class Station : public Buyable
{
    Q_OBJECT
    Q_PROPERTY(int RentW1S READ RentW1S)
    Q_PROPERTY(int RentW2S READ RentW2S)
    Q_PROPERTY(int RentW3S READ RentW3S)
    Q_PROPERTY(int RentW4S READ RentW4S)
private:
    QVector<int> rent;
public:
    explicit Station(int index, QString name, TileType::Tiles type, int price, QObject *parent = nullptr);
    explicit Station(QObject *parent = nullptr);
    explicit Station(Station &station);
    Q_INVOKABLE QString actOnPlayer(Player * player);
    int RentW1S();
    int RentW2S();
    int RentW3S();
    int RentW4S();
public slots:

signals:

};

#endif // STATION_H
