import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: view
    width: 768
    height: 768

    function init(playersNumber)
    {
        switch(playersNumber)
        {
        case 1:
            rectangle1.visible = false
            rectangle2.visible = false
            rectangle3.visible = false
            break
        case 2:
            rectangle2.visible = false
            rectangle3.visible = false
            break
        case 3:
            rectangle3.visible = false
            break
        default:
            break
        }
    }

    function posToCord(pos, xModifier, yModifier)
    {
        switch(pos)
        {
        case 0:
            return {x: 692+xModifier, y:692+yModifier}
        case 1:
            return {x: 610+xModifier, y:692+yModifier}
        case 2:
            return {x: 548+xModifier, y:692+yModifier}
        case 3:
            return {x: 488+xModifier, y:692+yModifier}
        case 4:
            return {x: 426+xModifier, y:692+yModifier}
        case 5:
            return {x: 364+xModifier, y:692+yModifier}
        case 6:
            return {x: 300+xModifier, y:692+yModifier}
        case 7:
            return {x: 239+xModifier, y:692+yModifier}
        case 8:
            return {x: 176+xModifier, y:692+yModifier}
        case 9:
            return {x: 114+xModifier, y:692+yModifier}
        case 10:
            return {x: 48+xModifier, y:680+yModifier}
        case 11:
            return {x: 32+xModifier, y:612+yModifier}
        case 12:
            return {x: 32+xModifier, y:550+yModifier}
        case 13:
            return {x: 32+xModifier, y:488+yModifier}
        case 14:
            return {x: 32+xModifier, y:426+yModifier}
        case 15:
            return {x: 32+xModifier, y:362+yModifier}
        case 16:
            return {x: 32+xModifier, y:300+yModifier}
        case 17:
            return {x: 32+xModifier, y:237+yModifier}
        case 18:
            return {x: 32+xModifier, y:176+yModifier}
        case 19:
            return {x: 32+xModifier, y:112+yModifier}
        case 20:
            return {x: 32+xModifier, y:30+yModifier}
        case 21:
            return {x: 114+xModifier, y:30+yModifier}
        case 22:
            return {x: 176+xModifier, y:30+yModifier}
        case 23:
            return {x: 238+xModifier, y:30+yModifier}
        case 24:
            return {x: 300+xModifier, y:30+yModifier}
        case 25:
            return {x: 363+xModifier, y:30+yModifier}
        case 26:
            return {x: 425+xModifier, y:30+yModifier}
        case 27:
            return {x: 488+xModifier, y:30+yModifier}
        case 28:
            return {x: 550+xModifier, y:30+yModifier}
        case 29:
            return {x: 612+xModifier, y:30+yModifier}
        case 30:
            return {x: 692+xModifier, y:30+yModifier}
        case 31:
            return {x: 692+xModifier, y:112+yModifier}
        case 32:
            return {x: 692+xModifier, y:176+yModifier}
        case 33:
            return {x: 692+xModifier, y:238+yModifier}
        case 34:
            return {x: 692+xModifier, y:300+yModifier}
        case 35:
            return {x: 692+xModifier, y:362+yModifier}
        case 36:
            return {x: 692+xModifier, y:424+yModifier}
        case 37:
            return {x: 692+xModifier, y:488+yModifier}
        case 38:
            return {x: 692+xModifier, y:550+yModifier}
        case 39:
            return {x: 692+xModifier, y:612+yModifier}
        default:
            break
        }
    }

    function move(pid, newPos)
    {
        var coords
        switch(pid+1)
        {
        case 1:
            coords = posToCord(newPos, 0, 0)
            rectangle.x = coords.x
            rectangle.y = coords.y
            break
        case 2:
            coords = posToCord(newPos, 25, 0)
            rectangle1.x = coords.x
            rectangle1.y = coords.y
            break
        case 3:
            coords = posToCord(newPos, 0, 25)
            rectangle2.x = coords.x
            rectangle2.y = coords.y
            break
        case 4:
            coords = posToCord(newPos, 25, 25)
            rectangle3.x = coords.x
            rectangle3.y = coords.y
            break
        default:
            break
        }
        console.log(coords.x, coords.y)
    }

    Rectangle {
        id: rectangle
        x: 692
        y: 692
        width: 20
        height: 20
        color: "#ff0000"
        radius: 20
        border.width: 1

        Text {
            id: pawnId1
            text: qsTr("1")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }
    }

    Rectangle {
        id: rectangle1
        x: 717
        y: 692
        width: 20
        height: 20
        color: "#00ff00"
        radius: 20
        border.width: 1

        Text {
            id: pawnId2
            text: qsTr("2")
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: rectangle2
        x: 692
        y: 717
        width: 20
        height: 20
        color: "#0000ff"
        radius: 20
        border.width: 1

        Text {
            id: pawnId3
            text: qsTr("3")
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: rectangle3
        x: 717
        y: 717
        width: 20
        height: 20
        color: "#fff000"
        radius: 20
        border.width: 1

        Text {
            id: pawnId4
            text: qsTr("4")
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
