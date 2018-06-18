import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: moneysFields
    visible: true
    width: 1366-768
    height: 160

    Ekran {
        id: firstM
        width: 100
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 20
        visible: true
        playerNameLabel: "Gracz 1"
    }

    Ekran {
        id: secondM
        anchors.left: parent.left
        anchors.leftMargin: 140
        anchors.top: parent.top
        anchors.topMargin: 30
        visible: true
        playerNameLabel: "Gracz 2"
    }

    Ekran {
        id: thirdM
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 90
        visible: true
        playerNameLabel: "Gracz 3"
    }

    Ekran {
        id: fourthM
        anchors.left: parent.left
        anchors.leftMargin: 140
        anchors.top: parent.top
        anchors.topMargin: 90
        visible: true
        playerNameLabel: "Gracz 4"
    }


    function field(witch, text)
    {
        if(witch === 0)
        {
            firstM.text(text)
        }
        if(witch === 1)
        {
            secondM.text(text)
        }
        if(witch === 2)
        {
            thirdM.text(text)
        }

        if(witch === 3)
        {
            fourthM.text(text)
        }
    }
    function visibility(witch)
    {
        if(witch === 0)
        {
            firstM.visible = true
        }
        if(witch === 1)
        {
            secondM.visible = true
        }
        if(witch === 2)
        {
            thirdM.visible = true
        }

        if(witch === 3)
        {
            fourthM.visible = true
        }
    }

}
