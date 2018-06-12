#ifndef UTILITY_H
#define UTILITY_H
#include "../tile.h"

class Utility : public Buyable
{
    Q_OBJECT
public:
    explicit Utility(int index, QString name, TileType::Tiles type, int price, QObject *parent = nullptr);
    explicit Utility(QObject *parent = nullptr);
    explicit Utility(Utility &utility);
    Q_INVOKABLE QString actOnPlayer(Player * player);
};

#endif // UTILITY_H
