import QtQuick 2.0

Item {
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
        x: 38
        y: 9
        text: "$1500"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 20
        font.family: "Times New Roman"
        renderType: Text.NativeRendering

    }
    function text(textToShow)
    {
        moneyText.text = "$"+textToShow
    }
}
