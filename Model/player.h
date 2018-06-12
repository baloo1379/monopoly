#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QVector>
#include "enums.h"

#define TOTAL_NUMBER_OF_TILES 40
#define INIT_MONEY 1500
#define GO_BONUS 200
//enum class NeighbourHoodType {Brown, Blue, HotPink, Orange, Red, Yellow, Green, Purple};

class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isInJail READ isInJail WRITE setIsInJail NOTIFY isInJailChanged)
    Q_PROPERTY(bool outOfJailCard READ outOfJailCard WRITE setOutOfJailCard NOTIFY outOfJailCardChanged)
    Q_PROPERTY(int Money READ Money WRITE setMoney NOTIFY MoneyChanged)
    Q_PROPERTY(int Position READ Position WRITE setPosition NOTIFY PositionChanged)
    Q_PROPERTY(int OldPosition READ OldPosition)
    Q_PROPERTY(int Index READ Index)
    Q_PROPERTY(QString Name READ Name)
    Q_PROPERTY(int Utilities READ Utilities WRITE setUtilities NOTIFY UtilitiesChanged)
    Q_PROPERTY(int Streets READ Streets WRITE setStreets NOTIFY StreetsChanged)
    Q_PROPERTY(int Stations READ Stations WRITE setStations NOTIFY StationsChanged)
    Q_PROPERTY(QList<int> Colors READ Colors WRITE setColors NOTIFY ColorsChanged)
    Q_PROPERTY(QList<bool> ColorsComplete READ ColorsComplete WRITE setColorsComplete NOTIFY ColorsCompleteChanged)
private:
    bool isinjail, outofjailcard;
    int index, money, position, oldPosistion, propNo, statNo, utilNo, brownNo, blueNo, hotPinkNo, orangeNo, redNo, yellowNo, greenNo, purpleNo;
    QString name;
    QVector<int> prop, stat, util;
    QList<int> colors;
    QList<bool> colorsCom;
public:
    explicit Player(int index, QString name, QObject *parent = nullptr);
    explicit Player(QObject *parent = nullptr);
    explicit Player(Player &player);
    bool isInJail();
    bool outOfJailCard();
    QString Name();
    int Money();
    int Position();
    int OldPosition();
    int Index();
    int Utilities();
    int Streets();
    int Stations();
    //Q_INVOKABLE int colors(int index);
    QList<int> Colors();
    QList<bool> ColorsComplete();
signals:
    void isInJailChanged(bool newValue);
    void outOfJailCardChanged(bool newValue);
    void MoneyChanged(int newValue);
    void PositionChanged(int newValue);
    void UtilitiesChanged(int newValue);
    void StreetsChanged(int newValue);
    void StationsChanged(int newValue);
    //Q_INVOKABLE void colorsChanged(int index, int newValue);
    void ColorsChanged(QList<int> newValue);
    void ColorsCompleteChanged(QList<bool> newValue);
public slots:
    void setIsInJail(bool value);
    void setOutOfJailCard(bool value);
    void setMoney(int value);
    void setPosition(int value);
    void setUtilities(int value);
    void setStreets(int value);
    void setStations(int value);
    //Q_INVOKABLE void setColors(int index, int value);
    void setColors(QList<int> value);
    void setColorsComplete(QList<bool> value);
    Q_INVOKABLE void addStreet(int streetIndex);
    Q_INVOKABLE void addStation(int stationIndex);
    Q_INVOKABLE void addUtility(int utilityIndex);
};

#endif // PLAYER_H
