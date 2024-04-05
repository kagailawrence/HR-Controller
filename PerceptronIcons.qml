import QtQuick 2.0


MouseArea {
    id: mouseArea
    width: 64; height: 64
    anchors.centerIn: parent
    drag.target: icon
    onReleased: parent = icon.Drag.target !== null ? icon.Drag.target : root

    Rectangle {
        id: icon
        width: 64; height: 64
        color:"blue"
        Drag.keys: [ zonec,zoneA,zoneB,zoned ]
        Drag.active: mouseArea.drag.active
        Drag.hotSpot.x: 32
        Drag.hotSpot.y: 32
        Text {
            anchors.fill: parent
            color: "white"
            font.pixelSize: 48
            text:perceptronIconsIndex
            horizontalAlignment:Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        states: State {
            when: mouseArea.drag.active
            ParentChange { target: icon; parent: root }
            AnchorChanges { target: icon; anchors.horizontalCenter: undefined; anchors.verticalCenter: undefined }
        }

    }
}
