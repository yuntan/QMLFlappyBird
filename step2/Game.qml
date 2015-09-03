import QtQuick 2.2

Item {
    id: game

    Image {
        id: land
        anchors.bottom: parent.bottom
        width: sourceSize.width * 2
        height: sourceSize.height * 2

        source: "../assets/land.png"
    }
}
