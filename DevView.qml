import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Window {
    id: mainWindows
    visible: true
    width: 768
    height: 768
    title: qsTr("Monopoly")

    property int i: 1

    Button {
        id: button
        x: 38
        y: 58
        width: 100
        height: 40
        text: qsTr("Bardzo długi tekst, który się nie miesci")
        contentItem: Text {
            text: parent.text
            font: parent.font
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
        }
        onClicked: {
            pawnView.move(3, mainWindows.i++)
            if(i==40) i=0
        }
     }

    PawnView {
        id: pawnView
        x:0
        y:0
    }

}
