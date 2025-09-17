import Quickshell
import Quickshell.Io
import QtQuick
import "center"

Rectangle {
    id: center

    color: "#1E1E2E"
    anchors.centerIn: parent
    radius: 15
    height: parent.height
    width: childrenRect.width + 20

    Row {
    spacing: 20

    anchors.centerIn: parent

    Music {}
    }
}