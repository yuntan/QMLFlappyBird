import QtQuick 2.2

AnimatedSprite {
    id: bird
    width: 34; height: 24

    property real v: 0

    source: "../../assets/bird_yellow.png"
    frameDuration: 600
    frameWidth: 17
    frameHeight: 12
    frameCount: 3
}
