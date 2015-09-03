import QtQuick 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    title: "Flappy Bird"
    width: 288
    height: 512
    visible: true

    Image {
        anchors.fill: parent
        source: "../assets/bg_day.png"
    }

    Game {
        id: game
        anchors.fill: parent
        Keys.onEscapePressed: close()
    }
}
