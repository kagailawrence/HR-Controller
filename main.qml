import QtQuick 2.3
import QtQuick.Window 2.2
import Qt.labs.platform 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.12
import QtQml 2.12
import QtQuick 2.12

Window {
    id: window
    width: 780
    height: 600
    visible: true

    Text {
        id: main_text
    }

    Rectangle {
        width: 400
        height: 400
        anchors.centerIn: parent
        border {
            width: 10 // Set the desired border width
            color: "black" // Set the color of the border
        }

        GridView {
            id: root
            width: 320
            height: 320
            anchors.centerIn: parent
            cellWidth: 150
            cellHeight: 150

            model: DelegateModel {
                id: visualModel
                model: ListModel {
                    id: colorModel
                    ListElement {
                        color: "Yellow"
                        text: "A"
                    }
                    ListElement {
                        color: "Yellow"
                        text: "B"
                    }
                    ListElement {
                        color: "Yellow"
                        text: "C"
                    }
                    ListElement {
                        color: "Yellow"
                        text: "D"
                    }
                }

                delegate: DropArea {
                    width: root.cellWidth
                    height: root.cellHeight

                    Rectangle {
                        width: parent.width - 10 // Adjusted width to accommodate spacing
                        height: parent.height - 10 // Adjusted height to accommodate spacing
                        x: 5 // Positioning to accommodate spacing
                        y: 5 // Positioning to accommodate spacing
                        color: 'gray'
                        border.width: 5 // border width of 5
                        border.color: "black"

                        Rectangle {
                            id: icon
                            width: 100
                            height: 100
                            radius: 50
                            anchors.centerIn: parent
                            color: visualIndex === 0 ? "red" : "yellow"
                            Text {
                                anchors.centerIn: parent
                                color: "black"
                                text: model.text
                            }
                            DragHandler {
                                id: dragHandler
                            }
                            Drag.active: dragHandler.active
                            Drag.source: icon
                            Drag.hotSpot.x: 36
                            Drag.hotSpot.y: 36

                            MouseArea {
                                anchors.fill: parent
                                onReleased: {
                                    var index = Math.floor(
                                                dragHandler.mouseX / root.cellWidth) + Math.floor(
                                                dragHandler.mouseY / root.cellHeight) * 2
                                    visualModel.items.move(icon.visualIndex,
                                                           index)
                                }
                            }

                            states: [
                                State {
                                    when: icon.Drag.active
                                    ParentChange {
                                        target: icon
                                        parent: root
                                    }
                                    AnchorChanges {
                                        target: icon
                                        anchors.horizontalCenter: undefined
                                        anchors.verticalCenter: undefined
                                    }
                                }
                            ]
                        }
                    }
                }
            }
        }
    }
}
