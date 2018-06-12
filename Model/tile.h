#ifndef TILE_H
#define TILE_H

#include <QObject>
#include "enums.h"
#include "player.h"

#define CHEAP_HOUSE 500;
#define NORMAL_HOUSE 1000;
#define GOOD_HOUSE 1500;
#define LUXURY_HOUSE 2000;
#define PRICE_MULTIPLER 1

//enum class NeighbourHoodType {Brown, Blue, HotPink, Orange, Red, Yellow, Green, Purple, Station, Utility};
//enum class TileType {Street, Station, Utility, Special, Tax, Chance, Empty};

class Tile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int Index READ Index WRITE setIndex NOTIFY IndexChanged)
    Q_PROPERTY(QString Name READ Name WRITE setName NOTIFY NameChanged)
    Q_PROPERTY(TileType::Tiles Type READ Type)
protected:
    int index;
    QString name;
    TileType::Tiles type;
public:
    explicit Tile(int index, QString name, TileType::Tiles type, QObject *parent = nullptr);
    explicit Tile(QObject *parent = nullptr);
    explicit Tile(Tile &tile);
    virtual int Index();
    virtual QString Name();
    virtual TileType::Tiles Type();
    virtual QString actOnPlayer(Player *player)=0;
    static int colorToInt(QString color);
signals:
    void IndexChanged(int newValue);
    void NameChanged(QString newValue);
public slots:
    virtual void setIndex(int value);
    virtual void setName(QString value);
};

class Buyable : public Tile
{
    Q_OBJECT
    Q_PROPERTY(int Price READ Price CONSTANT)
    Q_PROPERTY(bool isAvaible READ isAvaible WRITE setIsAvaible NOTIFY isAvaibleChanged)
    Q_PROPERTY(Player* Owner READ Owner WRITE setOwner NOTIFY OwnerChanged)
protected:
    int price;
    bool isavaible;
    Player *owner;
public:
    explicit Buyable(int index, QString name, TileType::Tiles type, float price, QObject *parent = nullptr);
    explicit Buyable(QObject *parent = nullptr);
    explicit Buyable(Buyable &buyable);
    virtual int Price();
    virtual bool isAvaible();
    virtual Player* Owner();
signals:
    void OwnerChanged(Player *newOwner);
    void isAvaibleChanged(bool newValue);
public slots:
    QString setOwner(Player *player);
    void setIsAvaible(bool value);
};

#endif // TILE_H
