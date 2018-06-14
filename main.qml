import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtQml.StateMachine 1.0

import Monopoly.Player 1.0
import Monopoly.Tile 1.0
import Monopoly.Buyable 1.0
import Monopoly.Station 1.0
import Monopoly.Street 1.0
import Monopoly.Special 1.0
import Monopoly.Utility 1.0
import Monopoly.ChanceCard 1.0
import Monopoly.Tax 1.0
import Monopoly.TileType 1.0
import Monopoly.NeighbourHoodType 1.0



Window {
    id: mainWindows
    visible: true
    width: 1366
    height: 768
    flags: Qt.WindowFullScreen
    visibility: Window.FullScreen
    title: qsTr("Monopoly")

    Item {
        id: moneysFields
        visible: false

        Ekran {id: firstM ;x: 800;y: 28;visible: false

            Label {
                id: player1
                x: 0
                y: -13
                text: qsTr("Gracz 1")
            }}
        Ekran {id: secondM ;x: 915;y: 28;visible: false

            Label {
                id: player2
                x: 0
                y: -13
                text: qsTr("Gracz 2")
            }}
        Ekran {id: thirdM ;x: 800;y: 83;visible: false

            Label {
                id: player3
                x: 0
                y: -13
                text: qsTr("Gracz 3")
            }}

        Ekran {id: fourthM ;x: 915;y: 83;visible: false

            Label {
                id: player4
                x: 0
                y: -13
                text: qsTr("Gracz 4")
            }}


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

    Button {
        id: closeButton
        text: qsTr("Wyjście")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        onClicked: {
            mainWindows.close()
        }
    }

    Button {
        id: nextState
        x: 915
        y: 143
        text: qsTr("Next State")
        visible: false
    }

    Button {
        visible: false
        id: rollButton
        x: 800
        y: 143
        text: qsTr("Rzucaj")
        onClicked: {
            var dublet = false
            var numberOfDublets = 0
            var move = 0
            if(board.player(board.currentPlayerIndex).isInJail) {
                dublet = false
                numberOfDublets = 0
                move = 0
                do {
                    dublet = playerRoll.roll(monopolyStateMachine.dice1, monopolyStateMachine.dice2)


                    if(!dublet) {
                        numberOfDublets++
                        move += monopolyStateMachine.dice1 + monopolyStateMachine.dice2
                        consoleNot.push("Kostka: "+monopolyStateMachine.dice1+", "+monopolyStateMachine.dice2)
                        consoleNot.push("Brak dubletu.")
                    }
                    else
                    {
                        move = monopolyStateMachine.dice1 + monopolyStateMachine.dice2
                        consoleNot.push("Kostka: "+monopolyStateMachine.dice1+", "+monopolyStateMachine.dice2+". Wychodzisz z więzienia. Ruch o "+move)
                        break
                    }
                } while(dublet || numberOfDublets < 3)
                if(numberOfDublets == 3) {
                    consoleNot.push("Nie wyrzuciłeś dubletu w 3 próbach, Opuszczasz kolejke.")
                    //board.player(board.currentPlayerIndex).isInJail = true
                    playerRoll.skip()
                }
                else {
                    board.player(board.currentPlayerIndex).isInJail = false
                    monopolyStateMachine.move = move
                    playerRoll.next()
                }
            }
            else {
                dublet = false
                numberOfDublets = 0
                move = 0
                do {
                    dublet = playerRoll.roll(monopolyStateMachine.dice1, monopolyStateMachine.dice2)
                    if(dublet) {
                        numberOfDublets++
                        move += monopolyStateMachine.dice1 + monopolyStateMachine.dice2
                        consoleNot.push("Kostka: "+monopolyStateMachine.dice1+", "+monopolyStateMachine.dice2+". Dublet.")
                    }
                    else
                    {
                        move += monopolyStateMachine.dice1 + monopolyStateMachine.dice2
                        consoleNot.push("Kostka: "+monopolyStateMachine.dice1+", "+monopolyStateMachine.dice2+". Ruch o "+move)
                        break
                    }
                } while(dublet || numberOfDublets == 3)
                if(numberOfDublets == 3) {
                    consoleNot.push("Rzuciłeś dublet 3 krotnie. Idziesz do więzienia")
                    board.player(board.currentPlayerIndex).isInJail = true
                    board.player(board.currentPlayerIndex).Position = 10
                    pawnView.move(board.currentPlayerIndex, 10)
                    playerRoll.skip()
                }
                else {
                    monopolyStateMachine.move = move
                    playerRoll.next()
                }
            }
            monopolyStateMachine.updateMoney();
        }
    }

    Button {
        visible: false
        id: buyButton
        x: 800
        y: 186
        text: qsTr("Kup")
        onClicked: {
            if(board.tile(board.player(board.currentPlayerIndex).Position).isAvaible) {
                var cp = board.player(board.currentPlayerIndex);
                var ctile = board.tile(board.player(board.currentPlayerIndex).Position);
                if(cp.Money < ctile.Price) {
                    consoleNot.push("Nie masz wystarczającej kwoty na koncie.")
                }
                else {
                    ctile.Owner = cp
                    cp.Money = -ctile.Price
                    if(ctile.Type === TileType.Street) {
                        cp.Colors[ctile.Neighbourhood] += 1
                        if( ( (cp.Position === 1 || cp.Position === 3) && (cp.Colors[ctile.Neighbourhood] === 2) ) || (cp.Colors[ctile.Neighbourhood] === 3))
                        {
                            cp.ColorsComplete[ctile.Neighbourhood] = true
                        }
                        cp.Streets++
                    }
                    if(board.tile(board.player(board.currentPlayerIndex).Position).Type === TileType.Station) {
                        board.player(board.currentPlayerIndex).Stations++
                    }
                    if(board.tile(board.player(board.currentPlayerIndex).Position).Type === TileType.Utility) {
                        board.player(board.currentPlayerIndex).Utilities++
                    }
                    boardView.avaibleMarkAt(board.player(board.currentPlayerIndex).Position)
                    consoleNot.push(board.player(board.currentPlayerIndex).Name + " kupil " + board.tile(board.player(board.currentPlayerIndex).Position).Name + " za $" + board.tile(board.player(board.currentPlayerIndex).Position).Price)

                }
                playerLanded.next()
            }
            else consoleNot.push("To miejsce jest zajęte.")
            monopolyStateMachine.updateMoney();
        }
    }

    Button {
        id: buyHouseButton
        x: 915
        y: 186
        text: qsTr("Kup apartament")
        visible: false
        onClicked: {
            var cplayer = board.player(board.currentPlayerIndex)
            var ctile = board.tile(cplayer.Position)
            var color = ctile.Neighbourhood
            //consoleNot.push("Informacje o polu")
            //consoleNot.push(ctile.Name + ", właściciel: Gracz" +  ctile.Owner.Name + ", kolor: " + color)
            if(ctile.BoughtedHouses < 4) {
                consoleNot.push(ctile.buyHouse(cplayer))
            }
            else {
                consoleNot.push("Nie możesz kupić więcej apartamentów w tej turze.")
                endTurn.next()
            }
            monopolyStateMachine.updateMoney();
            //consoleNot.push("Kupionych: " + ctile.BoughtedHouses)
        }
    }

    Button {
        id: outOfJailButton
        y: 229
        x: 800
        visible: false
        text: qsTr("Wyjdź z więzien.")
        onClicked: {
            consoleNot.push("Używasz karty wyjścia z więzienia")
            board.player(board.currentPlayerIndex).isInJail = false
            board.player(board.currentPlayerIndex).outOfJailCard = false
            monopolyStateMachine.updateMoney();
            playerRoll.repeat()
        }
    }

    Button {
        id: menaging
        x: 915
        y: 229
        text: "Zarządzaj"
        visible: false
        onClicked:
        {
            propertyView.show(board.currentPlayerIndex)
        }
    }

    Konsola {
        id: consoleNot
        x: 220
        y: 184
        width: 300
        height: 300
        visible: false
        anchors.horizontalCenter: boardView.horizontalCenter
        anchors.verticalCenter: boardView.verticalCenter
    }

    Wizard {
        id: initialWizard
        visible: false
    }

    PropertyView {
        id: propertyView
        x: 186
        y: 85
        z: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
    }

    BoardView {
        id: boardView
        visible: false
        x: 0
        y: 0
        z: -2
    }

    PawnView {
        id: pawnView
        x:0
        y:0
        visible: false
        z: 1
    }

    StateMachine {
        id: monopolyStateMachine
        animated: true
        running: true
        initialState: gameWizard

        property int dice1: 0
        property int dice2: 0
        property int move: 0

        function updateMoney()
        {
            //console.log("update")
            for(var q = 0; q < initialWizard.playersNo; q++)
            {
                //console.log(q)
                moneysFields.field(q, board.player(q).Money)
            }
        }

        State {
            id: gameWizard
            SignalTransition {
                targetState: gameInitialization
                signal: form.onPlayersNamesChanged
            }
            SignalTransition {
                targetState: gameInitialization
                signal: nextState.clicked
            }
            onEntered: {
                console.log("gameWizard entered")
                initialWizard.visible = true
                //initialWizard.playersNo = 1
                //initialWizard.playerNames = ["baloo"]
                //form.playersNames = initialWizard.playerNames
            }
            onExited: {
                console.log("gameWizard exited")
                initialWizard.visible = false
            }
        }

        State {
            id: gameInitialization
            signal next()
            SignalTransition {
                targetState: playerRoll
                signal: gameInitialization.next
            }
            SignalTransition {
                targetState: playerRoll
                signal: nextState.clicked
            }
            onEntered: {
                console.log("gameInitialization entered")

                for(var i=0; i<initialWizard.playersNo; i++) {
                    console.log(i,form.playersNames[i])
                    board.addPlayer(form.playersNames[i]);
                }

                for(var j=0; j<initialWizard.playersNo; j++) {
                    console.log(board.player(j).Name);
                }
                boardView.visible = true
                menaging.visible = true
                pawnView.init(initialWizard.playersNo)
                pawnView.visible = true
                moneysFields.visible = true;
                for(var k=0; k<initialWizard.playersNo; k++)
                {
                    moneysFields.field(k, 1500)
                    moneysFields.visibility(k)
                }

                //board.player(0).isInJail = true
                //board.player(0).outOfJailCard = false
                consoleNot.visible = true
                consoleNot.push("Witaj w Monopoly");
                gameInitialization.next()

            }
            onExited: {
                console.log("gameInitialization exited")
            }
        }

        State {
            id: playerRoll

            signal next()
            signal repeat()
            signal skip()

            SignalTransition {
                targetState: playerMove
                signal: nextState.clicked
            }
            SignalTransition {
                targetState: playerMove
                signal: playerRoll.next
            }
            SignalTransition {
                targetState: playerRoll
                signal: playerRoll.repeat
            }
            SignalTransition {
                targetState: playerTurn
                signal: playerRoll.skip
            }

            function roll(dice1, dice2)
            {
                monopolyStateMachine.dice1 = parseInt(Math.random()*6+1)
                monopolyStateMachine.dice2 = parseInt(Math.random()*6+1)
                if(monopolyStateMachine.dice1 === monopolyStateMachine.dice2) return true
                else return false
            }

            onEntered: {
                console.log("playerRoll entered")
                consoleNot.push("Gracz "+board.player(board.currentPlayerIndex).Name + " rzuca.")
                monopolyStateMachine.updateMoney();
                nextState.visible = false
                rollButton.visible = true
                if(board.player(board.currentPlayerIndex).isInJail) {
                    consoleNot.push("Jestes w wiezieniu, uzyj karty, lub wyrzuc dublet. Masz 3 podejcia.")
                    if( board.player(board.currentPlayerIndex).outOfJailCard) {
                        outOfJailButton.visible = true
                    }
                }
            }
            onExited: {
                monopolyStateMachine.updateMoney();
                rollButton.visible = false
                outOfJailButton.visible = false
                console.log("playerRoll exited")
            }
        }

        State {
            id: playerMove
            signal next()
            SignalTransition {
                targetState: playerLanded
                signal: playerMove.next
            }
            onEntered: {
                console.log("playerMove entered")
                //playerRoll.ofDublets = 0
                var msg1 = "Gracz "+(parseInt(board.currentPlayerIndex)+parseInt(1))+" przechodzi z pola "+board.player(board.currentPlayerIndex).Position
                board.player(board.currentPlayerIndex).Position += monopolyStateMachine.move
                pawnView.move(board.currentPlayerIndex, board.player(board.currentPlayerIndex).Position)
                var msg2 = " na pole "+board.player(board.currentPlayerIndex).Position
                consoleNot.push(msg1+msg2)
                monopolyStateMachine.updateMoney();
                playerMove.next()
            }
            onExited: {
                console.log("playerMove exited")
            }
        }

        State {
            id: playerLanded
            signal next()
            SignalTransition {
                targetState: endTurn
                signal: nextState.clicked
            }
            SignalTransition {
                targetState: endTurn
                signal: playerLanded.next
            }

            onEntered: {
                console.log("playerLanded entered")
                consoleNot.push(board.tile(board.player(board.currentPlayerIndex).Position).Index + " " + board.tile(board.player(board.currentPlayerIndex).Position).Name + "\n" + board.tile(board.player(board.currentPlayerIndex).Position).actOnPlayer(board.player(board.currentPlayerIndex)))
                pawnView.move(board.currentPlayerIndex, board.player(board.currentPlayerIndex).Position)
                if (board.tile(board.player(board.currentPlayerIndex).Position).Type == TileType.Street || board.tile(board.player(board.currentPlayerIndex).Position).Type == TileType.Utility || board.tile(board.player(board.currentPlayerIndex).Position).Type == TileType.Station) {
                    if(board.tile(board.player(board.currentPlayerIndex).Position).isAvaible) {
                        buyButton.visible = true
                        nextState.text = "Cancel"
                    }
                    else {
                        nextState.text = "Ok"
                    }
                }
                else
                {
                    nextState.text = "Ok"
                }


                nextState.visible = true
                monopolyStateMachine.updateMoney();
            }
            onExited: {
                console.log("playerLanded exited")
                buyButton.visible = false
                nextState.visible = false
            }
        }

        State {
            id: endTurn
            signal next()
            SignalTransition {
                targetState: playerTurn
                signal: nextState.clicked
            }
            SignalTransition {
                targetState: playerTurn
                signal: endTurn.next

            }
            onEntered: {
                console.log("endTurn entered")
                nextState.visible = true
                monopolyStateMachine.updateMoney();
                if(((board.player(board.currentPlayerIndex).Position === 1 || board.player(board.currentPlayerIndex).Position === 3) && (board.player(board.currentPlayerIndex).Colors[board.tile(board.player(board.currentPlayerIndex).Position).Neighbourhood] === 2)) || board.player(board.currentPlayerIndex).Colors[board.tile(board.player(board.currentPlayerIndex).Position).Neighbourhood] === 3 )
                {
                    buyHouseButton.visible = true
                }
                else endTurn.next()
            }
            onExited: {
                buyHouseButton.visible = false
                console.log("endTurn exited")
            }
        }

        State {
            id: playerTurn
            signal next()
            SignalTransition {
                targetState: playerRoll
                signal: nextState.clicked
            }
            SignalTransition {
                targetState: playerRoll
                signal: playerTurn.next
            }
            onEntered: {
                console.log("playerTurn entered")
                if(board.currentPlayerIndex == initialWizard.playersNo-1) board.currentPlayerIndex = -1
                board.currentPlayerIndex++
                monopolyStateMachine.updateMoney();
                playerTurn.next()
            }
            onExited: {
                console.log("playerTurn exited")
            }
        }
    }

}
