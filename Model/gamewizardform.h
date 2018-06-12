#ifndef GAMEWIZARDFORM_H
#define GAMEWIZARDFORM_H

#include <QObject>

class GameWizardForm : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QString> playersNames READ playersNames WRITE setPlayersNames NOTIFY playersNamesChanged)
private:
    QList<QString> m_pn;
public:
    explicit GameWizardForm(QObject *parent = nullptr);
    QList<QString> playersNames();
signals:
    void playersNamesChanged(QList<QString> newArg);
public slots:
    void setPlayersNames(QList<QString> arg);
};

#endif // GAMEWIZARDFORM_H
