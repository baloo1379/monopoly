import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: consoleInsideId

    ListModel {
        id: consoleModel
    }

    function log(variable)
    {
        console.log(variable)
    }

    function addToConsole(where, what)
    {
        console.log(what)
        if(input.text != "" && /\S/.test(what)) {
            console.log("added")
            where.append({msg: what})
            vbar.position = 1.0
        }
        else console.log("not added")
    }

    function push(message)
    {
        consoleModel.append({msg: message})
        vbar.position = 1.0
    }

    TextField {
        id: input
        y: 440
        width: parent.width - 15 - button.width
        height: 30
        anchors.topMargin: -35
        z: 2
        anchors.leftMargin: 5
        font.pointSize: 10
        renderType: Text.NativeRendering
        anchors.left: parent.left
        placeholderText: qsTr("Wyślij wiadomość...")
        anchors.top: parent.bottom
        onAccepted: {
            parent.addToConsole(consoleModel, input.text)
            input.clear()
        }

    }

    Button {
        id: button
        x: 542
        width: 90
        height: 30
        text: qsTr("Wyślij")
        anchors.topMargin: -35
        anchors.top: parent.bottom
        anchors.rightMargin: 5
        anchors.right: parent.right
        focusPolicy: Qt.TabFocus
        spacing: 6
        autoExclusive: false
        checked: false
        checkable: false
        highlighted: false
        z: 1
        onClicked: {
            parent.addToConsole(consoleModel, input.text)
            input.clear()
        }
    }

    Rectangle {
        id: consoleWindow
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#ffffff"
        border.color: "#b3b3b3"
        border.width: 0

        Rectangle {
            id: consoleInside
            width: parent.width - 10
            height: parent.height - 50
            color: "#ffffff"
            radius: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            border.color: "#b3b3b3"
            border.width: 1
        }

        Component {
            id: msgDelegate

            Row {
                id: row
                spacing: 2
                width: scrollView.width - scrollView.padding*2;
                Text {
                    id: textMsg
                    text: msg;
                    elide: Text.ElideLeft
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    width: scrollView.width - scrollView.padding*2;
                }
            }
        }

        ScrollView {
            id: scrollView
            x: 8
            y: 8
            width: parent.width - 10
            height: parent.height - 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            font.pointSize: 10
            contentWidth: 370
            hoverEnabled: false
            focusPolicy: Qt.NoFocus
            enabled: true
            wheelEnabled: true
            spacing: 0
            padding: 5
            clip: true
            ScrollBar.vertical: ScrollBar {
                id: vbar
                anchors.leftMargin: -10
                spacing: -5
                wheelEnabled: true
                active: true
                parent: scrollView.parent
                anchors.top: scrollView.top
                anchors.left: scrollView.right
                anchors.bottom: scrollView.bottom
            }
            ListView {
                id: mainList
                width: 2
                contentWidth: 370
                flickableDirection: Flickable.VerticalFlick
                boundsBehavior: Flickable.StopAtBounds
                highlightRangeMode: ListView.NoHighlightRange
                model: consoleModel
                delegate: msgDelegate
            }
        }

    }
}
