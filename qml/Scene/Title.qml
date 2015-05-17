import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Item {
    signal beginPlay()

    Image {
        width: sourceSize.width * 2
        height: sourceSize.height * 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 80
        source: "../../assets/title.png"
    }

    Button {
        width: 104; height: 58
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
        onClicked: beginPlay()

        style: ButtonStyle {
            background: Image {
                source: "../../assets/play.png"
            }
        }
    }
}
