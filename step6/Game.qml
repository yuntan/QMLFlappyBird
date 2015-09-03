import QtQuick 2.2
import "Scene"

Item {
    id: game

    Title {
        id: title
        anchors.fill: parent
        visible: game.state === 'title'
        onBeginPlay: game.state = 'play'
    }

    Play {
        id: play
        anchors.fill: parent
        visible: game.state !== 'title'
        onGameOver: {
            console.log("score: ", score);
            result.score = score;
            game.state = 'result';
        }
    }

    Result {
        id: result
        anchors.fill: parent
        visible: game.state === 'result'
        onBackToTitle: game.state = 'title'
    }

    state: 'title'

    states: [
        State {
            name: "title"
        },
        State {
            name: "play"
            StateChangeScript {
                script: play.start()
            }
        },
        State {
            name: "result"
        }
    ]
}

