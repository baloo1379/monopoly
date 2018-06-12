#include "chancecardgenerator.h"

ChanceCardGenerator::ChanceCardGenerator(QObject *parent) : QObject(parent)
{

}

QString ChanceCardGenerator::goToJail(Player *player)
{
    player->setIsInJail(true);
    player->setPosition(10);
    emit jailChanged();
    return "Idziesz do więzienia, nie przechodzisz przez start";
}

QString ChanceCardGenerator::bonusMoney(Player *player)
{
    player->setMoney(50);
    return "Bank płaci ci bonus $50.";
}

QString ChanceCardGenerator::freeJail(Player *player)
{
    player->setOutOfJailCard(true);
    return "Karta wyjścia z więzienia.";
}



QString  ChanceCardGenerator::GenerateRandomCard(Player *player)
{
    int xyz = qrand()%5;
    switch(xyz)
    {
    case 1:
        return goToJail(player);
        break;
    case 2:
        return freeJail(player);
        break;
    case 3:
        return bonusMoney(player);
        break;
    default:
        //return "empty chance card";
        break;
    }
}


