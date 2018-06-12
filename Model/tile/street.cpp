#include <QDebug>
#include "street.h"

Street::Street(int index, QString name, TileType::Tiles type, int nh, float price, QVector<float> rent, QObject *parent)
    : Buyable(index, name, type, price, parent), mortgage(price/2), buyhouse(1), buyhotel(0), boughthotel(0), boughthouses(0), neighbourhood(nh)
{
    if(neighbourhood == 0 || neighbourhood == 1) { housecost = CHEAP_HOUSE;}
    if(neighbourhood == 2 || neighbourhood == 3) { housecost = NORMAL_HOUSE;}
    if(neighbourhood == 4 || neighbourhood == 5) { housecost = GOOD_HOUSE;}
    if(neighbourhood == 6 || neighbourhood == 7) { housecost = LUXURY_HOUSE;}
    for(auto i : rent)
    {
        this->rent.push_back(static_cast<int>(i*PRICE_MULTIPLER));
    }
}

Street::Street(QObject *parent) : Buyable(0, "", TileType::Tiles::Empty, 0, parent),  mortgage(0), buyhouse(0), buyhotel(0), boughthotel(0), boughthouses(0), neighbourhood(0)
{
    rent.fill(0,6);
}

Street::Street(Street &street)
{
    index = street.index;
    name = street.name;
    type = street.type;
    price = street.price;
    mortgage = street.mortgage;
    buyhouse = street.buyhouse;
    buyhotel = street.buyhotel;
    boughthotel = street.buyhotel;
    boughthouses = street.boughthouses;
    neighbourhood = street.neighbourhood;
    rent = street.rent;
}

QString Street::actOnPlayer(Player *player)
{
    qDebug() << "Acting on the street"<< Name();
    if(Owner() == nullptr)
    {
        qDebug() << "No owner";
        return Name() + " jest dostępny.";
    }
    else if (Owner()->Index() == player->Index()) {
        qDebug() << player->Name() << "is the owner.\nHouses: " << boughthouses << "\nHotel: "<<boughthotel;
        return Name() + " jest twoja.";
    }
    else
    {
        qDebug() << "rent\nHouses: " << boughthouses << "\nHotel: "<<boughthotel << "ng: " << Owner()->Colors()[this->Neighbourhood()];
        int rentToPay = 0;
        if(boughthouses == 0)
        {
            if(Owner()->Colors()[this->Neighbourhood()] < 3) {
                rentToPay = rent[0];
            }
            else {
                rentToPay = 2 * rent[0];
            }
            player->setMoney(-rentToPay);
            Owner()->setMoney(rentToPay);
            return Name() + " posiada " + Owner()->Name() + ". " + player->Name() + " płaci $" + QString::number(rentToPay) + " czynszu.";
        }
        else if(boughthouses > 0 || boughthouses <= 4)
        {
            rentToPay = rent[boughthouses];
            player->setMoney(-rentToPay);
            Owner()->setMoney(rentToPay);
            return Owner()->Name() + " posiada " + boughthouses + "domów na" + Name() + ". " + player->Name() + " płaci $" + QString::number(rentToPay) + " czynszu.";
        }
        else if(boughthouses == 5 && boughthotel == 1)
        {

        }

    }
}

int Street::Rent()
{
    return rent[0];
}
int Street::RentW1H()
{
    return rent[1];
}
int Street::RentW2H()
{
    return rent[2];
}
int Street::RentW3H()
{
    return rent[3];
}
int Street::RentW4H()
{
    return rent[4];
}
int Street::RentWH()
{
    return rent[5];
}
int Street::HouseCost()
{
    return housecost;
}
int Street::BoughtedHouses()
{
    return boughthouses;
}

int Street::Neighbourhood()
{
    return neighbourhood;
}

QString Street::buyHouse(Player * player)
{
    if(Owner() == nullptr) return "Nie możesz kupić tu apartamentu";
    else if(Owner()->Index() == player->Index())
    {
        qDebug() << "buing";
        if(buyhouse && !buyhotel)
        {
            qDebug() << "house";
            if(boughthouses >=0 || boughthouses <= 4)
            {
                if(player->Money() > Price())
                {
                    player->setMoney(-Price());
                    boughthouses++;
                    emit BoughtedHousesChanged(boughthouses);
                    if(boughthouses == 4)
                    {
                        buyhouse = false;
                        buyhotel = true;
                    }
                    return player->Name() + " kupił apartament";
                }
                else return "Nie masz pieniędzy by kupić apartament";
            }
            else return "Nie możesz kupić więcej apartamentów";
        }
        else
        {
            qDebug() << "hotel";
            boughthouses = 5;
            buyhouse = false;
            buyhotel = false;
            boughthotel = true;
            emit BoughtedHousesChanged(5);
            return player->Name() + " kupił hotel";
        }
    }
    else return "Nie możesz kupić tu apartamentu";
}
QString Street::setOwner(Player * player)
{
    if(!isavaible)
    {
        return "Posiadłość jest zajęta.";
    }
    else
    {
        owner = player;
        buyhouse = true;
        emit OwnerChanged(player);
        setIsAvaible(false);
        return "Właściciel ustawiony na " + Owner()->Name();
    }
}
