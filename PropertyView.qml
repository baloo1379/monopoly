import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Item {
    id: view
    width: 1024
    height: 768
    visible: true

    property string danied: "Nie możesz kupić więcej apartamentów."
    property string daniedNg: "Nie możesz kupić apartamentu. Nie posiadasz całej dzielnicy."

    function show(cpid)
    {
        view.visible = true
        for(var i=0; i<40; i++)
        {

            if(board.tile(i).Owner === board.player(cpid))
            {
                console.log("hit")
                switch(i) {
                case 5:
                    trainButton1.enabled = true
                    break
                case 15:
                    trainButton2.enabled = true
                    break
                case 25:
                    trainButton3.enabled = true
                    break
                case 35:
                    trainButton4.enabled = true
                    break
                case 12:
                    utilButton1.enabled = true
                    break
                case 28:
                    utilButton2.enabled = true
                    break
                case 1:
                    button1.enabled = true
                    break
                case 3:
                    button3.enabled = true
                    break
                case 6:
                    button6.enabled = true
                    break
                case 8:
                    button8.enabled = true
                    break
                case 9:
                    button9.enabled = true
                    break
                case 11:
                    button11.enabled = true
                    break
                case 13:
                    button13.enabled = true
                    break
                case 14:
                    button14.enabled = true
                    break
                case 16:
                    button16.enabled = true
                    break
                case 18:
                    button18.enabled = true
                    break
                case 19:
                    button19.enabled = true
                    break
                case 21:
                    button21.enabled = true
                    break
                case 23:
                    button23.enabled = true
                    break
                case 24:
                    button24.enabled = true
                    break
                case 26:
                    button26.enabled = true
                    break
                case 27:
                    button27.enabled = true
                    break
                case 29:
                    button29.enabled = true
                    break
                case 31:
                    button31.enabled = true
                    break
                case 32:
                    button32.enabled = true
                    break
                case 34:
                    button34.enabled = true
                    break
                case 37:
                    button37.enabled = true
                    break
                case 39:
                    button39.enabled = true
                    break
                default:
                    break
                }
            }
        }
    }

    function hide()
    {
        view.visible = false
        text1.text = ""
        trainButton1.enabled = false
        trainButton2.enabled = false
        trainButton3.enabled = false
        trainButton4.enabled = false
        utilButton1.enabled = false
        utilButton2.enabled = false
        button1.enabled = false
        button3.enabled = false
        button6.enabled = false
        button8.enabled = false
        button9.enabled = false
        button11.enabled = false
        button13.enabled = false
        button14.enabled = false
        button16.enabled = false
        button18.enabled = false
        button19.enabled = false
        button21.enabled = false
        button23.enabled = false
        button24.enabled = false
        button26.enabled = false
        button27.enabled = false
        button29.enabled = false
        button31.enabled = false
        button32.enabled = false
        button34.enabled = false
        button37.enabled = false
        button39.enabled = false
    }


    Button {
        id: button
        x: 722
        y: 614
        text: qsTr("Wyjdź")
        font.weight: Font.ExtraLight
        z: 2
        onClicked: {
            parent.hide();
        }
    }

    Rectangle {
        id: bg
        x: 0
        y: 0
        width: 640
        height: 560
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#999999"
        border.width: 2
    }

    Rectangle {
        id: bgFocus
        width: 1024
        height: 768
        color: "#ffffff"
        opacity: 0.4
        z: -1
    }

    Rectangle {
        id: brown
        x: 202
        y: 114
        width: 300
        height: 90
        color: "#996600"
        border.width: 1

        Button {
            id: button1
            y: 15
            width: 135
            height: 70
            text: qsTr(board.tile(1).Name)
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            highlighted: false
            hoverEnabled: false
            focusPolicy: Qt.NoFocus
            enabled: false
            clip: false
            checkable: false
            checked: false
            autoRepeat: false
            autoExclusive: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap

            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(1).Neighbourhood] === 2)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(1)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button3
            x: 162
            y: 15
            width: 135
            height: 70
            text: qsTr(board.tile(3).Name)
            anchors.verticalCenterOffset: 0
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(3).Neighbourhood] === 2)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(3)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg

            }
        }
    }

    Rectangle {
        id: blue
        x: 522
        y: 114
        width: 300
        height: 90
        color: "#0066ff"
        border.width: 1

        Button {
            id: button6
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(6).Name)
            font.capitalization: Font.MixedCase
            wheelEnabled: false
            spacing: 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(6).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(6)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg

            }
        }

        Button {
            id: button8
            x: -210
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(8).Name)
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(8).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(8)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button9
            x: 196
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(9).Name)
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(9).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(9)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }
    }

    Rectangle {
        id: hotPink
        x: 202
        y: 214
        width: 300
        height: 90
        color: "#ff3366"
        border.width: 1

        Button {
            id: button13
            x: -300
            y: 15
            width: 87
            height: 70
            text:  qsTr(board.tile(13).Name)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(13).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(13)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button14
            x: -210
            y: 15
            width: 87
            height: 70
            text:  qsTr(board.tile(14).Name)
            anchors.right: parent.right
            anchors.rightMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            anchors.verticalCenter: parent.verticalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(14).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(14)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button11
            y: 15
            width: 87
            height: 70
            text:  qsTr(board.tile(11).Name)
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            anchors.left: parent.left
            autoRepeat: false
            clip: false
            autoExclusive: false
            highlighted: false
            anchors.leftMargin: 10
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(11).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(11)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }
    }

    Rectangle {
        id: orange
        x: 522
        y: 214
        width: 300
        height: 90
        color: "#ff6633"
        border.width: 1

        Button {
            id: button16
            y: 15
            width: 87
            height: 70
            text:  qsTr(board.tile(16).Name)
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(16).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(16)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button18
            x: -210
            y: 15
            width: 87
            height: 70
            text:  qsTr(board.tile(18).Name)
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(18).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(18)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button19
            y: 15
            width: 87
            height: 70
            text:  qsTr(board.tile(19).Name)
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            anchors.leftMargin: 10
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(19).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(19)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }
    }

    Rectangle {
        id: red
        x: 202
        y: 314
        width: 300
        height: 90
        color: "#ff3333"
        border.width: 1

        Button {
            id: button21
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(21).Name)
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(21).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(21)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button23
            x: -210
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(23).Name)
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(23).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(23)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button24
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(24).Name)
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(24).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(24)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }
    }

    Rectangle {
        id: yellow
        x: 522
        y: 314
        width: 300
        height: 90
        color: "#ffff00"
        border.width: 1

        Button {
            id: button26
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(26).Name)
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(26).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(26)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button27
            x: -210
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(27).Name)
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(27).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(27)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button29
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(29).Name)
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            anchors.leftMargin: 10
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(29).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(29)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }
    }

    Rectangle {
        id: green
        x: 202
        y: 414
        width: 300
        height: 90
        color: "#009966"
        border.width: 1

        Button {
            id: button31
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(31).Name)
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(31).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(31)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button32
            x: -210
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(32).Name)
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(32).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(32)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button34
            y: 15
            width: 87
            height: 70
            text: qsTr(board.tile(34).Name)
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            anchors.leftMargin: 10
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(34).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(34)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }

        }
    }

    Rectangle {
        id: purple
        x: 522
        y: 414
        width: 300
        height: 90
        color: "#6633cc"
        border.width: 1

        Button {
            id: button37
            y: 15
            width: 135
            height: 70
            text:  qsTr(board.tile(37).Name)
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(37).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(37)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

        Button {
            id: button39
            x: -210
            y: 15
            width: 135
            height: 70
            text: qsTr(board.tile(39).Name)
            anchors.right: parent.right
            anchors.rightMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            anchors.verticalCenter: parent.verticalCenter
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
            onClicked: {
                if(board.player(board.currentPlayerIndex).Colors[board.tile(39).Neighbourhood] === 3)
                {
                    var cplayer = board.player(board.currentPlayerIndex)
                    var ctile = board.tile(39)
                    var color = ctile.Neighbourhood
                    //consoleNot.push("Informacje o polu")
                    //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
                    if(ctile.BoughtedHouses < 4) {
                        text1.text = ctile.buyHouse(cplayer)
                    }
                    else {
                        text1.text = view.danied
                    }
                    monopolyStateMachine.updateMoney();
                }
                else text1.text = view.daniedNg
            }
        }

    }

    Rectangle {
        id: trains
        x: 202
        y: 514
        width: 300
        height: 90
        color: "#999999"
        border.width: 1

        Button {
            id: trainButton1
            width: 135
            height: 30
            text:  qsTr(board.tile(5).Name)
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
        }

        Button {
            id: trainButton2
            width: 135
            height: 30
            text: qsTr(board.tile(15).Name)
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
        }

        Button {
            id: trainButton3
            y: 20
            width: 135
            height: 30
            text: qsTr(board.tile(25).Name)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
        }

        Button {
            id: trainButton4
            x: 205
            y: 16
            width: 135
            height: 30
            text: qsTr(board.tile(35).Name)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
        }
    }

    Rectangle {
        id: utilities
        x: 522
        y: 514
        width: 300
        height: 90
        color: "#999999"
        border.width: 1

        Button {
            id: utilButton1
            y: 15
            width: 135
            height: 70
            text: qsTr(board.tile(12).Name)
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            autoExclusive: false
            clip: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
        }

        Button {
            id: utilButton2
            x: 159
            y: 15
            width: 135
            height: 70
            text: qsTr(board.tile(28).Name)
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            enabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: false
            autoRepeat: false
            clip: false
            autoExclusive: false
            highlighted: false
            checked: false
            checkable: false
            contentItem: Text {
                color: parent.enabled ? "#000000" : "#5b5b5b"
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
            }
        }
    }

    Rectangle {
        id: textOutput
        x: 202
        y: 614
        width: 507
        height: 40
        color: "#ffffff"
        border.width: 1

        Text {
            id: text1
            text: ""
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
        }
    }

}
