#include "player.h"
#include "enums.h"

Player::Player(int index, QString name, QObject *parent)
    : QObject(parent), index(index), money(INIT_MONEY), isinjail(false), outofjailcard(false), position(0), name(name), propNo(0), statNo(0), utilNo(0), brownNo(0), blueNo(0), hotPinkNo(0), orangeNo(0), redNo(0), yellowNo(0), greenNo(0), purpleNo(0)
{
    for(int i=0; i<8; i++)
    {
        colors.append(0);
        colorsCom.append(false);
    }
}

Player::Player(QObject *parent)
    : QObject(parent), index(0), money(INIT_MONEY), isinjail(false), outofjailcard(false), position(0), name(""), propNo(0), statNo(0), utilNo(0), brownNo(0), blueNo(0), hotPinkNo(0), orangeNo(0), redNo(0), yellowNo(0), greenNo(0), purpleNo(0)
{
    for(int i=0; i<8; i++)
    {
        colors.append(0);
        colorsCom.append(false);
    }
}

Player::Player(Player &player)
{
    this->index = player.Index();
    this->money = player.Money();
    this->isinjail = player.isInJail();
    this->outofjailcard = player.outOfJailCard();
    this->position = player.Position();
    this->name = player.Name();
    this->propNo = player.Streets();
    this->statNo = player.Stations();
    this->utilNo = player.Utilities();
    /*
    this->brownNo = player.colors(0);
    this->blueNo = player.blueNo;
    this->hotPinkNo = player.hotPinkNo;
    this->orangeNo = player.orangeNo;
    this->redNo = player.redNo;
    this->yellowNo = player.yellowNo;
    this->greenNo = player.greenNo;
    this->purpleNo = player.purpleNo;
    */
    this->colors = player.colors;
    this->colorsCom = player.colorsCom;
}

bool Player::isInJail()
{
    return isinjail;
}
bool Player::outOfJailCard()
{
    return outofjailcard;
}
QString Player::Name()
{
    return name;
}
int Player::Money()
{
    return money;
}
int Player::Position()
{
    return position;
}

int Player::OldPosition()
{
    return oldPosistion;
}
int Player::Index()
{
    return index;
}
int Player::Utilities()
{
    return utilNo;
}
int Player::Streets()
{
    return propNo;
}
int Player::Stations()
{
    return statNo;
}
/*
int Player::colors(int index)
{
    switch(index)
    {
    case 0:
        return brownNo;
        break;
    case 1:
        return blueNo;
        break;
    case 2:
        return hotPinkNo;
        break;
    case 3:
        return orangeNo;
        break;
    case 4:
        return redNo;
        break;
    case 5:
        return yellowNo;
        break;
    case 6:
        return greenNo;
        break;
    case 7:
        return purpleNo;
        break;
    default:
        return 0;
        break;
    }
}
*/
QList<int> Player::Colors()
{
    return colors;
}

QList<bool> Player::ColorsComplete()
{
    return colorsCom;
}

void Player::setIsInJail(bool value)
{
    if(isinjail != value)
    {
        isinjail = value;
        emit isInJailChanged(value);
    }
}
void Player::setOutOfJailCard(bool value)
{
    if(outofjailcard != value)
    {
        outofjailcard = value;
        emit outOfJailCardChanged(value);
    }
}
void Player::setMoney(int value)
{
    if(money != value)
    {
        money += value;
        emit MoneyChanged(value);
    }
}
void Player::setPosition(int value)
{

    if(position != value)
    {
        int newPosition = value;

        if(newPosition <= 0) { newPosition += TOTAL_NUMBER_OF_TILES; }
        if(newPosition >= TOTAL_NUMBER_OF_TILES)
        {
            newPosition -= TOTAL_NUMBER_OF_TILES;
            setMoney(GO_BONUS);
        }
        oldPosistion = position;
        position = newPosition;
        emit PositionChanged(value);
    }
}
void Player::setUtilities(int value)
{
    if(utilNo != value)
    {
        utilNo = value;
        emit UtilitiesChanged(value);
    }
}
void Player::setStreets(int value)
{
    if(propNo != value)
    {
        propNo = value;
        emit StreetsChanged(value);
    }
}
void Player::setStations(int value)
{
    if(statNo != value)
    {
        statNo = value;
        emit StationsChanged(value);
    }
}
void Player::addUtility(int utilityIndex)
{
    util.push_back(utilityIndex);
    setUtilities(statNo+1);
}
void Player::addStreet(int streetIndex)
{
    prop.push_back(streetIndex);
    setStations(propNo+1);
}
void Player::addStation(int stationIndex)
{
    stat.push_back(stationIndex);
    setStations(statNo+1);
}
/*
void Player::setColors(int index, int value) {
    switch(index)
    {
    case 0:
        if(brownNo != value)
        {
            brownNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 1:
        if(blueNo != value)
        {
            blueNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 2:
        if(hotPinkNo != value)
        {
            hotPinkNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 3:
        if(orangeNo != value)
        {
            orangeNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 4:
        if(redNo != value)
        {
            redNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 5:
        if(yellowNo != value)
        {
            yellowNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 6:
        if(greenNo != value)
        {
            greenNo = value;
            emit colorsChanged(index, value);
        }
        break;
    case 7:
        if(purpleNo != value)
        {
            purpleNo = value;
            emit colorsChanged(index, value);
        }
        break;
    default:
        break;
    }
}
*/
void Player::setColors(QList<int> value)
{
    if(colors != value)
    {
        colors = value;
        emit ColorsChanged(value);
    }
}

void Player::setColorsComplete(QList<bool> value)
{
    if(colorsCom != value)
    {
        colorsCom = value;
        emit ColorsCompleteChanged(value);
    }
}
