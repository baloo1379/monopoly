#include "gamewizardform.h"

GameWizardForm::GameWizardForm(QObject *parent) : QObject(parent)
{

}

QList<QString> GameWizardForm::playersNames()
{
    return m_pn;
}

void GameWizardForm::setPlayersNames(QList<QString> arg)
{
    if(m_pn != arg)
    {
        m_pn = arg;
        emit playersNamesChanged(arg);
    }
}
