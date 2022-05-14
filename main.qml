import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Resizable Rectangle")

    ResizableRectangle{
        x: 200
        y: 200
        implicitWidth: 100
        implicitHeight: 100
        color: "lightblue"
        Label {
            text: "View 1"
            anchors.centerIn: parent
        }
        radius: 10
    }
}
