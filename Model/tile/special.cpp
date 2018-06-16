#include "special.h"

Special::Special(int index, QString name, TileType::Tiles type, QObject *parent)
    : Tile(index, name, type, parent) {}

Special::Special(QObject *parent)
    : Tile(0, "", TileType::Tiles::Empty, parent) {}

Special::Special(Special &special)
    : Tile(special.index, special.name, TileType::Tiles::Special) {}

QString Special::actOnPlayer(Player *player)
{
    if(Index() == 0)
    {
        player->setMoney(200);
        return "Start. Collect 200";
    }
    else if(Index() == 10) return "Odzwiedzasz więzienie.";
    else if(Index() == 20) return "Darmowy parking";
    else {
        player->setIsInJail(true);
        player->setPosition(10);
        return "Idziesz do więzienia.";
    }
}
