import QtQuick 2.2

SpriteSequence {
    id: bird
    width: 34
    height: 24

    property real v: 0

    Sprite {
        name: 'flying'
        source: "../../assets/bird_yellow.png"
        //            frameDuration: isUpdraft ? 50 : 600
        //            frameDuration: bird.v < 0 ? 50 : 600
        frameDuration: 600
        frameWidth: 17
        frameHeight: 12
        frameCount: 3
    }

    Sprite {
        name: 'drafting'
        source: "../../assets/bird_yellow.png"
        //            frameDuration: isUpdraft ? 50 : 600
        frameDuration: 50
        frameWidth: 17
        frameHeight: 12
        frameCount: 3
    }

    Sprite {
        name: 'die'
        source: "../../assets/bird_yellow.png"
        frameX: 51
        frameWidth: 17
        frameHeight: 12
        frameCount: 1
    }
}
