#include "chancecard.h"
#include "chancecardgenerator.h"

ChanceCard::ChanceCard(int index, QString name, TileType::Tiles type, QObject *parent)
    : Tile(index, name, type, parent) {}

ChanceCard::ChanceCard(QObject *parent)
 : Tile(0, "", TileType::Tiles::Empty, parent) {}

ChanceCard::ChanceCard(ChanceCard &chancecard)
 : Tile(chancecard.index, chancecard.name, TileType::Tiles::Chance) {}

QString ChanceCard::actOnPlayer(Player *player)
{
    ChanceCardGenerator gen;
    return gen.GenerateRandomCard(player);
}
