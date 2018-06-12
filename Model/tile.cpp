#include "tile.h"

TileType::TileType(QObject *parent) : QObject(parent) {}

NeighbourHoodType::NeighbourHoodType(QObject *parent) : QObject(parent) {}

Tile::Tile(int index, QString name, TileType::Tiles type, QObject *parent)
    : QObject(parent), index(index), name(name), type(type) {}

Tile::Tile(QObject *parent) : QObject(parent), index(0), name(""), type(TileType::Tiles::Empty) {}

Tile::Tile(Tile &tile)
{
    index = tile.index;
    name = tile.name;
    type = tile.type;
}

int Tile::Index()
{
    return index;
}
QString Tile::Name()
{
    return name;
}
TileType::Tiles Tile::Type()
{
    return type;
}

void Tile::setIndex(int value)
{
    if(index != value)
    {
        index = value;
        emit IndexChanged(value);
    }
}
void Tile::setName(QString value)
{
    if(name != value)
    {
        name = value;
        emit NameChanged(value);
    }
}

Buyable::Buyable(int index, QString name, TileType::Tiles type, float price, QObject *parent)
    : Tile(index, name, type, parent), price(static_cast<int>(price)), isavaible(true), owner(nullptr) {}

Buyable::Buyable(QObject *parent) : Tile(0, "", TileType::Tiles::Empty, parent), price(0), isavaible(true), owner(nullptr) {}

Buyable::Buyable(Buyable &buyable)
{
    index = buyable.index;
    name = buyable.index;
    type = buyable.type;
    price = buyable.price;
    isavaible = buyable.isavaible;
    owner = buyable.owner;
}

int Buyable::Price()
{
    return price;
}
Player* Buyable::Owner()
{
    return owner;
}

int Tile::colorToInt(QString color)
{
    if(color == "brown" || color == "Brown") return 0;
    if(color == "blue" || color == "Blue") return 1;
    if(color == "hotPink" || color == "HotPink" || color == "hotpink") return 2;
    if(color == "orange" || color == "Orange") return 3;
    if(color == "red" || color == "Red") return 4;
    if(color == "yellow" || color == "Yellow") return 5;
    if(color == "green" || color == "Green") return 6;
    if(color == "purple" || color == "Purple") return 7;
    if(color == "station" || color == "Station") return 8;
    if(color == "utility" || color == "Utility") return 9;
}

bool Buyable::isAvaible()
{
    return isavaible;
}

void Buyable::setIsAvaible(bool value)
{
    if(isavaible != value)
    {
        isavaible = value;
        emit isAvaibleChanged(value);
    }
}
QString Buyable::setOwner(Player *player)
{
    if(!isavaible)
    {
        return "You cant buy this property";
    }
    else
    {
        owner = player;
        //buyhouse = true;
        emit OwnerChanged(player);
        setIsAvaible(false);
        return "Done";
    }
}
