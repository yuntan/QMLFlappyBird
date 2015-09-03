import QtQuick 2.2
import "Entity"

Item {
    id: game

    Keys.onSpacePressed: pyon()
    focus: true

    property int t: 0
    property real g: 0.5
    property real pyonV: 8

    function pyon() {
        bird.v = -pyonV
    }

    function update() {
        // fall down
        bird.v += g
        bird.y += bird.v
    }

    Bird {
        id: bird
        x: (parent.width - width) / 3
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
        running: true
        interval: 33
        repeat: true
        onTriggered: {
            update()
            t++
        }
    }
}

