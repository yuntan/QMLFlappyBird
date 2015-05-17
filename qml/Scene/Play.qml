import QtQuick 2.2
import "../Entity"

Item {
    id: play

    Keys.onSpacePressed: if (isPlaying)
                             pyon()
    focus: true

    property bool isPlaying: false
    property int t: 0
    property real g: 0.5
    property real pyonV: 8
    property bool isUpdrafting: false
    //    property int updraftCount: 0
    //    property int updraftMax: 30
    property int score: 0

    signal gameOver(int score)

    function start() {
        isPlaying = true
        stage.clear()
        bird.jumpTo('flying')
        bird.x = (width - bird.width) / 3
        bird.y = (height - bird.height) / 3
        score = 0
    }

    function pyon() {
        bird.v = -pyonV
        isUpdrafting = true
        //        updraftCount = 0;
        bird.jumpTo('drafting')
    }

    function update() {
        // fall down
        bird.v += g
        bird.y += bird.v

        //        updraftCount++;
        //        if (updraftCount >= updraftMax) {
        //            isUpdraft = false;
        //        }
        if (isUpdrafting && bird.v > 0) {
            isUpdrafting = false
            bird.jumpTo('flying')
        }

        // collision detection
        if (bird.y <= 0 || bird.y + bird.height >= land.y) {
            // game over
            goOver()
        }

        if (!stage.isClear(bird.x + bird.width, bird.y, bird.y + bird.height)) {
            goOver()
        } else if (stage.scoreUp(bird.x)) {
            score++;
        }
    }

    function goOver() {
        isPlaying = false
        bird.v = 0
        bird.jumpTo('die')
        gameOver(score)
    }

    //        AnimatedSprite {
    //            id: bird
    //            width: 34; height: 24
    //            //        anchors.centerIn: parent

    //            property real v: 0

    //            source: "../../assets/bird_yellow.png"
    //            frameDuration: isUpdraft ? 50 : 600
    //            frameWidth: 17
    //            frameHeight: 12
    //            frameCount: 3
    //        }
    Stage {
        id: stage
        anchors {
            top: play.top
            bottom: land.bottom
            left: play.left
            right: play.right
        }

        Bird {
            id: bird
        }
    }

    Image {
        id: land
        anchors.bottom: parent.bottom
        width: sourceSize.width * 2
        height: sourceSize.height * 2

        source: "../../assets/land.png"
    }

    Timer {
        id: timer
        running: isPlaying
        interval: 33
        repeat: true
        onTriggered: {
            play.update()
            stage.update()
            t++
        }
    }
}
