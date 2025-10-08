import Quickshell
import Quickshell.Io
import QtQuick
import "modules"
import "./services/"
import "GlobalStates"
import "modules/Media"


PanelWindow {
  id: root
  anchors {
    top: true
    left: true
    right: true
  }

  color: "transparent"

  implicitHeight: Config.barHeight
  Rectangle {
    color: "transparent"
    anchors {
      bottom: parent.bottom
      horizontalCenter: parent.horizontalCenter
    }

    implicitHeight: 35
    width: parent.width
    
    Right {}

    Center {}
  }
}