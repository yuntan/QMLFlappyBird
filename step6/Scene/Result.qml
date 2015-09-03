import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Item {
    property int score: 0

    signal backToTitle

    Image {
        width: sourceSize.width * 2
        height: sourceSize.height * 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 80
        source: "../../assets/over.png"
    }

    Image {
        width: sourceSize.width * 2
        height: sourceSize.height * 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 150
        source: "../../assets/scoreboard.png"
    }

    Button {
        width: 104
        height: 58
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
        onClicked: backToTitle()

        style: ButtonStyle {
            background: Image {
                source: "../../assets/back.png"
            }
        }
    }
}
