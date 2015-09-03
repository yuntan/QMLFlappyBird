import QtQuick 2.2

Item {
    id: stage

    property int itemInterval: 200

    width: 500

    Pipe {
        id: pipe1
        height: stage.height
    }
    Pipe {
        id: pipe2
        height: stage.height
    }
    Pipe {
        id: pipe3
        height: stage.height
    }

    function update() {
        var items = [pipe1, pipe2, pipe3]
        items.sort(function (a, b) {
            return a.x < b.x ? -1 : 1
        })
        for (var i = 0; i < items.length; i++) {
            var item = items[i]
            item.x -= 2
            if (item.x + item.width < -10) {
                //                item.x = items[items.length - 1].x + itemInterval
                setPipeRandom(item, items[items.length - 1].x + itemInterval)
            }
        }
    }

    function clear() {
        var items = [pipe1, pipe2, pipe3]
        for (var i = 0; i < items.length; i++) {
            var item = items[i]
            //            item.x = stage.width + itemInterval * i
            setPipeRandom(item, stage.width + itemInterval * i)
        }
    }

    function setPipeRandom(item, x) {
        item.x = x
        //            item.clearAreaTop = 60;
        //            item.clearAreaHeight = 80;
        item.clearAreaTop = Math.random() * height / 2 + 30
        item.clearAreaHeight = Math.random() * height / 3 + 80
    }

    function isClear(x, upper, lower) {
        var items = [pipe1, pipe2, pipe3]
        for (var i = 0; i < items.length; i++) {
            var item = items[i]
            if (item.x < x && item.x + item.width > x) {
                return item.clearAreaTop < upper
                        && item.clearAreaTop + item.clearAreaHeight > lower
            }
        }
        return true
    }

    function scoreUp(x) {
        var items = [pipe1, pipe2, pipe3]
        for (var i = 0; i < items.length; i++) {
            var item = items[i]
            if (Math.abs(item.x + item.width - x) < 1.1) {
                return true;
            }
        }
        return false;
    }
}
