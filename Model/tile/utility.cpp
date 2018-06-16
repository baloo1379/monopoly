#include <QDebug>
#include "utility.h"

Utility::Utility(int index, QString name, TileType::Tiles type, int price, QObject *parent)
 : Buyable(index, name, type, price, parent) {}

Utility::Utility(QObject *parent): Buyable(0, "", TileType::Tiles::Empty, 0, parent) {}

Utility::Utility(Utility &utility)
{
    index = utility.index;
    name = utility.index;
    type = utility.type;
    price = utility.price;
    isavaible = utility.isavaible;
    owner = utility.owner;
}


/*
int Utility::RentW1U(int dice)
{
    return dice*4;
}
int Utility::RentW2U(int dice)
{
    return dice*10;
}
*/
QString Utility::actOnPlayer(Player *player)
{
    qDebug() << "Acting on the utility"<< Name();
    if(Owner() == nullptr)
    {
        qDebug() << "No owner";
        return Name() + " jest dostępny.";
    }
    else if (Owner()->Index() == player->Index()) {
        qDebug() << player->Name() << "is the owner.";
        return Name() + " jest twoja.";
    }
    else
    {

        int rentToPay = player->Position() - player->OldPosition();
        if(rentToPay < 0) rentToPay *= -1;
        if(Owner()->Utilities()<=1)
        {
            rentToPay *= 4;
        }
        if(Owner()->Utilities()>1)
        {
            rentToPay *= 10;
        }
        qDebug() << "rent" << Owner()->Name() << player->Name() << Owner()->Utilities() << rentToPay;
        player->setMoney(-rentToPay);
        Owner()->setMoney(rentToPay);
        return Name() + " posiada " + Owner()->Name() + ". " + player->Name() + " płaci $" + QString::number(rentToPay) + " czynszu.";
    }
}
