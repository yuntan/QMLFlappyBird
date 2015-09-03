import QtQuick 2.2

Item {
    property int clearAreaTop: 0
    property int clearAreaHeight: 0

    width: upperPipe.width

    Image {
        id: upperPipe
        width: sourceSize.width * 2
        height: sourceSize.height * 2
        source: "../../assets/pipe1.png"
        rotation: 180
//        anchors.top: parent.top
        y: clearAreaTop - height
    }

    Image {
        id: lowerPipe
        width: sourceSize.width * 2
        height: sourceSize.height * 2
        source: "../../assets/pipe1.png"
//        anchors.bottom: parent.bottom
        y: clearAreaTop + clearAreaHeight
    }
}
