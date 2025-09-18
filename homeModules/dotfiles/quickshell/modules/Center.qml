import Quickshell
import Quickshell.Io
import QtQuick
import qs.services
import "Media"

Rectangle {
    id: center

    color: Colours.bgcolor
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