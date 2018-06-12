#ifndef CHANCECARDGENERATOR_H
#define CHANCECARDGENERATOR_H

#include <QObject>
#include <QVector>
#include "../tile.h"

class ChanceCardGenerator : public QObject
{
    Q_OBJECT
private:
    QString goToJail(Player *player);
    QString bonusMoney(Player *player);
    QString freeJail(Player *player);
public:
    explicit ChanceCardGenerator(QObject *parent = nullptr);
    Q_INVOKABLE QString GenerateRandomCard(Player *player);

signals:
    Q_INVOKABLE void jailChanged();
public slots:
};

#endif // CHANCECARDGENERATOR_H
