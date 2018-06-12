import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    property int playersNo: 0
    property variant playerNames: ["Gracz 1", "Gracz 2", "Gracz 3", "Gracz 4"]

    width: 1024
    height: 768

    Text {
        id: gameName
        x: 314
        y: 125
        text: qsTr("Monopoly")
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: -235
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        transformOrigin: Item.Center
        font.pixelSize: 54
    }

    Item {
        id: firstSlide
        x: 0
        y: 260
        width: 1024
        height: 508
        visible: true

        Text {
            id: step1
            x: 13
            y: 22
            text: "Krok 1 z 2"
            font.pixelSize: 12
        }

        Button {
            id: button1
            x: 885
            y: 430
            text: qsTr("Dalej")
            onClicked: {
                if(playerNoField.text == "" || parseInt(playerNoField.text) <= 0 || parseInt(playerNoField.text) > 4) {
                    playerNoLabel.text = qsTr("Błąd. Podaj liczbę graczy (1-4)")
                    playerNoField.text = ""
                }
                else {
                    playersNo = parseInt(playerNoField.text)
                    firstSlide.visible = false;
                    secondSlide.visible = true;
                }
            }
        }

        Text {
            id: playerNoLabel
            x: 63
            y: 102
            text: qsTr("Podaj liczbę graczy")
            font.pixelSize: 12
        }

        TextField {
            id: playerNoField
            x: 63
            y: 122
            text: qsTr("")
            placeholderText: "1-4"
        }

        Rectangle {
            id: step1bg
            width: 1024
            height: 508
            color: "#ffffff"
            z: -1
        }
    }

    Item {
        id: secondSlide
        x: 0
        y: 260
        width: 1024
        height: 508
        visible: false

        Text {
            id: step2
            x: 13
            y: 22
            text: "Krok 2 z 3"
            font.pixelSize: 12
        }

        ListView {
            id: listView
            y: 73
            width: 631
            height: 238
            anchors.left: step2.left
            anchors.leftMargin: 0
            clip: false
            spacing: 4
            contentWidth: 12
            model: playersNo
            delegate: Row {
                id: row
                width: 350
                height: 40
                Text {
                    x: 16
                    y: 13
                    id: text32
                    text: "Gracz "+(index+1)
                }
                TextField {
                    id: playerName
                    x: 140
                    y: 0
                    width: 205
                    placeholderText: "Name"
                    onTextEdited: {
                        playerNames[index] = this.text
                    }
                }
            }
        }

        Button {
            id: button2
            x: 885
            y: 430
            text: qsTr("Graj")
            onClicked: {
                secondSlide.visible = false;
                form.playersNames = playerNames
            }

        }

        Rectangle {
            id: step2bg
            width: 800
            height: 340
            color: "#ffffff"
            z: -1
        }
    }
}
