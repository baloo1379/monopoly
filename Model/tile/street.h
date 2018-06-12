#ifndef STREET_H
#define STREET_H
#include "../tile.h"

class Street : public Buyable
{
    Q_OBJECT
    Q_PROPERTY(int Rent READ Rent)
    Q_PROPERTY(int RentW1H READ RentW1H)
    Q_PROPERTY(int RentW2H READ RentW2H)
    Q_PROPERTY(int RentW3H READ RentW3H)
    Q_PROPERTY(int RentW4H READ RentW4H)
    Q_PROPERTY(int RentWH READ RentWH)
    Q_PROPERTY(int HouseCost READ HouseCost)
    Q_PROPERTY(int BoughtedHouses READ BoughtedHouses NOTIFY BoughtedHousesChanged)
    Q_PROPERTY(int Neighbourhood READ Neighbourhood)
private:
    int mortgage, housecost, boughthouses;
    bool buyhouse, buyhotel, boughthotel;
    QVector<int> rent;
    int neighbourhood;

public:
    explicit Street(int index, QString name, TileType::Tiles type, int nh, float price, QVector<float> rent, QObject *parent = nullptr);
    explicit Street(QObject *parent = nullptr);
    explicit Street(Street &street);
    Q_INVOKABLE QString actOnPlayer(Player * player);
    int Rent();
    int RentW1H();
    int RentW2H();
    int RentW3H();
    int RentW4H();
    int RentWH();
    int HouseCost();
    int BoughtedHouses();
    int Neighbourhood();
public slots:
    Q_INVOKABLE QString buyHouse(Player * player);
    QString setOwner(Player * player);
signals:
    void BoughtedHousesChanged(int newValue);
};

#endif // STREET_H
