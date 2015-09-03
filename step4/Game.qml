import QtQuick 2.2
import "Entity"

Item {
    id: game

    Keys.onSpacePressed: isPlaying ? pyon() : start()
    focus: true

    property int t: 0
    property real g: 0.5
    property real pyonV: 8

    property bool isPlaying: false
    property int score: 0

    function start() {
        console.debug("starting width: " + width);
        isPlaying = true;
        stage.clear();
        bird.x = (width - bird.width) / 3;
        bird.y = (height - bird.height) / 3;
        score = 0;
        // timer.start()
        // timer.stop()
    }

    function pyon() {
        console.debug("pyon");
        bird.v = -pyonV
    }

    function update() {
        // fall down
        bird.v += g;
        bird.y += bird.v;

        // collision detection
        if (bird.y <= 0 || bird.y + bird.height >= land.y) {
            // game over
            goOver();
        }

        if (!stage.isClear(bird.x + bird.width, bird.y, bird.y + bird.height)) {
            goOver();
        } else if (stage.scoreUp(bird.x)) {
            score++;
            console.debug("update score: " + score);
        }
    }

    function goOver() {
        isPlaying = false;
        bird.v = 0;
        console.debug("goOver score: " + score)
    }

    Stage {
        id: stage
        anchors {
            top: game.top
            bottom: land.bottom
            left: game.left
            right: game.right
        }
    }

    Bird {
        id: bird
    }

    Image {
        id: land
        anchors.bottom: parent.bottom
        width: sourceSize.width * 2
        height: sourceSize.height * 2

        source: "../assets/land.png"
    }

    Timer {
        id: timer
        running: isPlaying
        interval: 33
        repeat: true
        onTriggered: {
            game.update();
            stage.update();
            t++;
        }
    }
}

