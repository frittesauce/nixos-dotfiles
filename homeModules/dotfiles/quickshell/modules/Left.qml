import Quickshell
import Quickshell.Io
import QtQuick
import qs.services
import "left"

Rectangle {
  id: left
  color: Colours.bgcolor
    anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        leftMargin: 10
    }
    radius: 15
    height: parent.height
    width: childrenRect.width + 20

Row {
    spacing: 10

    anchors {
        verticalCenter: parent.verticalCenter
        horizontalCenter: parent.horizontalCenter
    }

  Clock { width: 55}

  Power { width: 15}
  
}
}