import QtQuick 2.0
import QtQuick.Controls 2.2


Item {
    id: firstM
    width: 100
    height: 30
    Rectangle {
        width: parent.width
        height: parent.height
        border.color: "#b6b6b6"
        border.width: 1
    }
    Text {
        id: moneyText
        width: parent.width
        height: parent.height
        text: "$1500"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 20
        font.family: "Times New Roman"
        renderType: Text.NativeRendering
    }

    Label {
        id: playerNameLabel
        y: 0
        text: qsTr("Gracz 1")
        anchors.left: parent.left
        anchors.leftMargin: 3
        anchors.bottom: parent.top
        anchors.bottomMargin: 0
        font.pointSize: 12
    }

    function text(textToShow)
    {
        moneyText.text = "$"+textToShow
    }

    function playerName(text)
    {
        playerNameLabel.text = text;
    }
}
