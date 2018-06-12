#include "tax.h"

Tax::Tax(int index, QString name, TileType::Tiles type, int amount, QObject *parent)
    : Tile(index, name, type, parent), m_amount(amount) {}

Tax::Tax(QObject *parent)
    : Tile(0, "", TileType::Tiles::Empty), m_amount(0) {}

Tax::Tax(Tax &tax)
    : Tile(tax.index, tax.name, TileType::Tiles::Tax), m_amount(tax.m_amount) {}

int Tax::Amount()
{
    return m_amount;
}

QString Tax::actOnPlayer(Player * player)
{
    player->setMoney(-this->m_amount);
    emit TaxAccorded(this->m_amount);
    return this->Name() + ": " + QString::number(this->m_amount);

}
