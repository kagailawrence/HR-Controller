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
    width: 580
    height: 420
    visible: true
    Rectangle{

        width: 300; height: 300
        anchors.centerIn: parent
        Grid {
            id: root
            width: parent.width
            height: parent.height
            spacing:2
            rows: 2
            Rectangle {
                id:zoneA
                color: "gray";
                width: parent.width/2; height: parent.height/2
                PerceptronIcons{
                    anchors.centerIn: parent
                }
                DropArea {
                    id: dragTarget
                    property alias dropProxy: dragTarget
                    anchors.centerIn: parent
                    width: parent.width/2; height: parent.height/2
                    Rectangle {
                        id: dropRectangle
                        anchors.centerIn: parent
                        radius:100
                        color: "red"
                        anchors.fill:parent
                        states: [
                            State {
                                when: dragTarget.containsDrag
                                PropertyChanges {
                                    target: dropRectangle
                                    color: "grey"
                                }
                            }
                        ]
                    }
                }
            }
            Rectangle {
                id:zoneB
                color: "yellow";
                width:  parent.width/2; height: parent.height/2
                PerceptronIcons{
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id:zonec
                color: "yellow";
                width: parent.width/2; height: parent.height/2
                PerceptronIcons{
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id:zoned
                color: "yellow";
                width: parent.width/2; height: parent.height/2
                PerceptronIcons{
                    anchors.centerIn: parent
                }
            }
        }
    }
}
