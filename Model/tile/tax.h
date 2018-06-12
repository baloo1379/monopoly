#ifndef TAX_H
#define TAX_H
#include "../tile.h"

class Tax : public Tile
{
    Q_OBJECT
    Q_PROPERTY(int Amount READ Amount CONSTANT)
private:
    int m_amount;
public:
    explicit Tax(int index, QString name, TileType::Tiles type, int amount, QObject *parent = nullptr);
    explicit Tax(QObject *parent = nullptr);
    explicit Tax(Tax &tax);
    int Amount();
    Q_INVOKABLE QString actOnPlayer(Player * player);
signals:
    Q_INVOKABLE void TaxAccorded(int newValue);
};

#endif // TAX_H
