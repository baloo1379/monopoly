#ifndef BOARD_H
#define BOARD_H

#include <QObject>
#include "player.h"
#include "tile.h"
#include "enums.h"

class Board : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentPlayerIndex READ currentPlayerIndex WRITE setCurrentPlayerIndex NOTIFY currentPlayerIndexChanged)
    Q_PROPERTY(int Dice READ Dice WRITE setDice NOTIFY DiceChanged)
private:

    int cpindex;
    int m_dice;
public:
    explicit Board(QObject *parent = nullptr);
    int currentPlayerIndex();
    int Dice();
    QVector<Tile*> m_tiles;
    QVector<Player*> m_players;
    //Q_INVOKABLE void initPlayers(QList<QString> list);
signals:
    void currentPlayerIndexChanged(int newValue);
    void DiceChanged(int newValue);
public slots:
    void setCurrentPlayerIndex(int value);
    void setDice(int value);
    Q_INVOKABLE void addPlayer(QString name);
    Q_INVOKABLE Player* player(int index);
    Q_INVOKABLE Tile* tile(int index);
};

#endif // BOARD_H
