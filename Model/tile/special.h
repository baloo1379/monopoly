#ifndef SPECIAL_H
#define SPECIAL_H

#include "../tile.h"


class Special : public Tile
{
    Q_OBJECT
public:
    explicit Special(int index, QString name, TileType::Tiles type, QObject *parent = nullptr);
    explicit Special(QObject *parent = nullptr);
    explicit Special(Special &special);
    Q_INVOKABLE QString actOnPlayer(Player * player);
signals:
    Q_INVOKABLE void jailChanged();
};

#endif // SPECIAL_H
