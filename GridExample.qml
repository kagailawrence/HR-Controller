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
        text:MyText.ui_Text
    }
    GridView {
        id: root
        width: 320; height: 480
        anchors.centerIn: parent
        cellWidth: 150; cellHeight: 150
        displaced: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
        }
        model: DelegateModel {
            id: visualModel
            model: ListModel {
                id: colorModel
                ListElement { color: "blue"
                    text:"Icon 1" }
                ListElement { color: "green"
                text:"Icon 2"}
                ListElement { color: "red"
                text:"Icon 3"}
                ListElement { color: "yellow"
                text:"Icon 4"}
            }
            delegate: DropArea {
                id: delegateRoot
                width: 150; height: 150
                onEntered: visualModel.items.move(drag.source.visualIndex, icon.visualIndex)
                property int visualIndex: DelegateModel.itemsIndex
                Binding { target: icon; property: "visualIndex"; value: visualIndex }
               onPositionChanged: {
//                       TestingTxt.ui_Text=model.text
                   main_text.text=TestingTxt.dateTime()+" The icon causing the changes is "+model.text

               }
                Rectangle {
                    id: icon
                    property int visualIndex: 0
                    width: 150; height: 150
                    radius: 100
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

                    color: parent.visualIndex==0 ? "grey" : model.color

                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        text: model.text
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
