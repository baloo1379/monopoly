#ifndef CHANCECARD_H
#define CHANCECARD_H

#include <QObject>
#include "../tile.h"

class ChanceCard : public Tile
{
    Q_OBJECT
private:

public:
    explicit ChanceCard(int index, QString name, TileType::Tiles type, QObject *parent = nullptr);
    explicit ChanceCard(QObject *parent = nullptr);
    explicit ChanceCard(ChanceCard &chancecard);
    Q_INVOKABLE QString actOnPlayer(Player * player);
signals:

public slots:
};



#endif // CHANCECARD_H
