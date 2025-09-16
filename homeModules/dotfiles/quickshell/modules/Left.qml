import Quickshell
import Quickshell.Io
import QtQuick
import "left"

Row {
    spacing: 10

    anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        leftMargin: 10
    }

  Clock { width: 55}

  Power { width: 15}
  
}