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
        width: 420
        height: 420
        anchors.centerIn: parent
        radius: 100
        border {
            width: 10
            color: "black"
        }
        GridView {
            id: root
            width: 400
            height: 400
            anchors.centerIn: parent
            anchors.leftMargin: 100
            cellWidth: 200
            cellHeight: 200
            displaced: Transition {
                NumberAnimation {
                    properties: "x,y"
                    easing.type: Easing.OutQuad
                }
            }
            model: DelegateModel {
                id: visualModel
                model: ListModel {
                    id: colorModel
                    ListElement {
                        color: "Yellow"
                        text: "A"
                        portrait: 'qrc:/images/homeIcon.png'
                    }
                    ListElement {
                        color: "Yellow"
                        text: "B"
                        portrait: 'qrc:/images/powerIcon.png'
                    }
                    ListElement {
                        color: "Yellow"
                        text: "C"
                        portrait: 'qrc:/images/reportIcon.png'
                    }
                    ListElement {
                        color: "yellow"
                        text: "D"
                        portrait: 'qrc:/images/settingIcon.png'
                    }
                }
                delegate: DropArea {
                    id: delegateRoot
                    width: 190
                    height: 190
                    onEntered: visualModel.items.move(drag.source.visualIndex,
                                                      icon.visualIndex)
                    property int visualIndex: DelegateModel.itemsIndex
                    Binding {
                        target: icon
                        property: "visualIndex"
                        value: visualIndex
                    }
                    onPositionChanged: {
                        main_text.text = " The icon causing the changes is " + model.text
                    }
                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: icon.visualIndex === 0 ? "green" : 'gray'
                        radius: 100
                        Rectangle {
                            id: icon
                            property int visualIndex: 0
                            width: 180
                            height: 180
                            radius: 100
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                verticalCenter: parent.verticalCenter
                            }

                            color: parent.parent.visualIndex == 0 ? "red" : 'yellow'
                            Text {
                                anchors.centerIn: parent
                                color: "black"
                                text: model.text
                            }
                            Image {
                                id: name
                                width: parent.width - 50
                                height: parent.height - 50
                                source: portrait
                                anchors.centerIn: parent
                            }
                            DragHandler {
                                id: dragHandler
                            }
                            Drag.active: dragHandler.active
                            Drag.source: icon
                            Drag.hotSpot.x: 36
                            Drag.hotSpot.y: 36
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
