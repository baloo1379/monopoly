#ifndef ENUMS_H
#define ENUMS_H

#include <QObject>

class TileType : public QObject
{
    Q_OBJECT

public:
    explicit TileType(QObject *parent = nullptr);
    enum class Tiles {Street, Station, Utility, Special, Tax, Chance, Empty};
    Q_ENUM(Tiles)
};

class NeighbourHoodType : public QObject
{
    Q_OBJECT

public:
    explicit NeighbourHoodType(QObject *parent = nullptr);
    enum class NeighbourHoods {Brown, Blue, HotPink, Orange, Red, Yellow, Green, Purple, Station, Utility};
    Q_ENUM(NeighbourHoods)
};

#endif // ENUMS_H
