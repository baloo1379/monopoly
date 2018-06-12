import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    width: 768
    height: 768
    visible: true

    Item {
        id: marks

        Rectangle {
            id: mark1
            x: 602
            y: 666
            width: 61
            height: 21
            color: "#ffffff"
            visible: false
            opacity: 0.3
            border.width: 0
        }

        Rectangle {
            id: mark3
            x: 481
            y: 666
            width: 59
            height: 21
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark6
            x: 294
            y: 666
            width: 61
            height: 21
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark8
            x: 170
            y: 666
            width: 59
            height: 21
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark9
            x: 107
            y: 666
            width: 60
            height: 21
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark11
            x: 83
            y: 604
            width: 20
            height: 60
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark13
            x: 83
            y: 480
            width: 20
            height: 61
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark14
            x: 83
            y: 418
            width: 20
            height: 60
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark16
            x: 83
            y: 292
            width: 20
            height: 61
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark18
            x: 83
            y: 168
            width: 20
            height: 60
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark19
            x: 83
            y: 104
            width: 20
            height: 61
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark21
            x: 107
            y: 80
            width: 60
            height: 21
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark23
            x: 230
            y: 80
            width: 61
            height: 21
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark24
            x: 293
            y: 80
            width: 60
            height: 21
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark39
            x: 666
            y: 604
            width: 20
            height: 60
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark37
            x: 666
            y: 480
            width: 20
            height: 61
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark34
            x: 666
            y: 292
            width: 20
            height: 61
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark32
            x: 666
            y: 168
            width: 20
            height: 59
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark31
            x: 666
            y: 104
            width: 20
            height: 61
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark29
            x: 605
            y: 80
            width: 58
            height: 21
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

        Rectangle {
            id: mark27
            x: 481
            y: 80
            width: 59
            height: 21
            color: "#ffffff"
            opacity: 0.3
            border.width: 0
            visible: false
        }

        Rectangle {
            id: mark26
            x: 418
            y: 80
            width: 60
            height: 21
            color: "#ffffff"
            border.width: 0
            opacity: 0.3
            visible: false
        }

    }

    function avaibleMarkAt(index)
    {
        switch(index)
        {
        case 1:
            mark1.visible = true
            break
        case 3:
            mark3.visible = true
            break
        case 6:
            mark6.visible = true
            break
        case 8:
            mark8.visible = true
            break
        case 9:
            mark9.visible = true
            break
        case 11:
            mark11.visible = true
            break
        case 13:
            mark13.visible = true
            break
        case 14:
            mark14.visible = true
            break
        case 16:
            mark16.visible = true
            break
        case 18:
            mark18.visible = true
            break
        case 19:
            mark19.visible = true
            break
        case 21:
            mark21.visible = true
            break
        case 23:
            mark23.visible = true
            break
        case 24:
            mark24.visible = true
            break
        case 26:
            mark26.visible = true
            break
        case 27:
            mark27.visible = true
            break
        case 29:
            mark29.visible = true
            break
        case 31:
            mark31.visible = true
            break
        case 32:
            mark32.visible = true
            break
        case 34:
            mark34.visible = true
            break
        case 37:
            mark37.visible = true
            break
        case 39:
            mark39.visible = true
            break
        default:
            break
        }
    }

    function housesMark(player, index, houses)
    {

    }

    Image {
        id: image
        x: 0
        y: 0
        width: 768
        height: 768
        z: -2
        source: "monopoly.png"
    }

    Item {
        id: prices

        Item {
            id: item1
            x: 602
            y: 746
            width: 61
            height: 22

            Text {
                id: price1
                x: -673
                y: -753
                text: "$"+board.tile(1).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item2
            x: 543
            y: 746
            width: 56
            height: 22
        }

        Item {
            id: item3
            x: 481
            y: 746
            width: 59
            height: 22

            Text {
                id: price3
                x: 19
                y: 0
                text: "$"+board.tile(3).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item4
            x: 419
            y: 746
            width: 60
            height: 22

            Text {
                id: price4
                x: 19
                y: 0
                text: "$"+board.tile(4).Amount
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item5
            x: 357
            y: 690
            width: 60
            height: 24

            Text {
                id: price5
                x: 19
                y: 5
                text: "$"+board.tile(5).Price
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item6
            x: 294
            y: 746
            width: 60
            height: 22

            Text {
                id: price6
                x: 20
                y: 0
                text: "$"+board.tile(6).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item7
            x: 232
            y: 746
            width: 59
            height: 22
        }

        Item {
            id: item8
            x: 169
            y: 746
            width: 60
            height: 22

            Text {
                id: price8
                x: 19
                y: 0
                text: "$"+board.tile(8).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item9
            x: 107
            y: 746
            width: 60
            height: 22

            Text {
                id: price9
                x: 17
                y: 0
                text: "$"+board.tile(9).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item10
            x: 0
            y: 666
            width: 103
            height: 102
        }

        Item {
            id: item11
            x: 0
            y: 604
            width: 22
            height: 60
            Text {
                id: price11
                text: "$"+board.tile(11).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item12
            x: 0
            y: 543
            width: 22
            height: 58
            Text {
                id: price12
                text: "$"+board.tile(12).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }

        }

        Item {
            id: item13
            x: 0
            y: 480
            width: 22
            height: 61
            Text {
                id: price13
                text: "$"+board.tile(13).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item14
            x: 0
            y: 418
            width: 22
            height: 60
            Text {
                id: price14
                text: "$"+board.tile(14).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item15
            x: 54
            y: 356
            width: 27
            height: 59
            Text {
                id: price15
                text: "$"+board.tile(15).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item16
            x: 0
            y: 292
            width: 22
            height: 61
            Text {
                id: price16
                text: "$"+board.tile(16).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item17
            x: 0
            y: 230
            width: 22
            height: 60
        }

        Item {
            id: item18
            x: 0
            y: 168
            width: 22
            height: 59
            Text {
                id: price18
                text: "$"+board.tile(18).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item19
            x: 0
            y: 105
            width: 22
            height: 60
            Text {
                id: price19
                text: "$"+board.tile(19).Price
                rotation: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item20
            x: 0
            y: 0
            width: 103
            height: 101
        }

        Item {
            id: item21
            x: 107
            y: 0
            width: 60
            height: 22
            Text {
                id: price21
                text: "$"+board.tile(21).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item22
            x: 170
            y: 0
            width: 58
            height: 22
        }

        Item {
            id: item23
            x: 230
            y: 0
            width: 61
            height: 22
            Text {
                id: price23
                text: "$"+board.tile(23).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item24
            x: 293
            y: 0
            width: 60
            height: 22
            Text {
                id: price24
                text: "$"+board.tile(24).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item25
            x: 355
            y: 53
            width: 60
            height: 25
            Text {
                id: price25
                text: "$"+board.tile(25).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item26
            x: 418
            y: 0
            width: 60
            height: 22
            Text {
                id: price26
                text: "$"+board.tile(26).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item27
            x: 481
            y: 0
            width: 59
            height: 22
            Text {
                id: price27
                text: "$"+board.tile(27).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item28
            x: 543
            y: 0
            width: 60
            height: 22
            Text {
                id: price28
                text: "$"+board.tile(28).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item29
            x: 605
            y: 0
            width: 58
            height: 22
            Text {
                id: price29
                text: "$"+board.tile(29).Price
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item30
            x: 666
            y: 0
            width: 102
            height: 101
        }

        Item {
            id: item31
            x: 746
            y: 105
            width: 22
            height: 60
            Text {
                id: price31
                text: "$"+board.tile(31).Price
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item32
            x: 746
            y: 168
            width: 22
            height: 59
            Text {
                id: price32
                text: "$"+board.tile(32).Price
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item33
            x: 746
            y: 230
            width: 22
            height: 60
        }

        Item {
            id: item34
            x: 746
            y: 292
            width: 22
            height: 61
            Text {
                id: price34
                text: "$"+board.tile(34).Price
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item35
            x: 689
            y: 356
            width: 24
            height: 59
            Text {
                id: price35
                text: "$"+board.tile(35).Price
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item36
            x: 746
            y: 418
            width: 22
            height: 60
        }

        Item {
            id: item37
            x: 746
            y: 480
            width: 22
            height: 61
            Text {
                id: price37
                text: "$"+board.tile(37).Price
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item38
            x: 746
            y: 544
            width: 22
            height: 57
            Text {
                id: price38
                text: "$"+board.tile(38).Amount
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }

        Item {
            id: item39
            x: 746
            y: 604
            width: 22
            height: 60
            Text {
                id: price39
                text: "$"+board.tile(39).Price
                rotation: 270
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }













    }

    Item {
        id: names

    }
}
