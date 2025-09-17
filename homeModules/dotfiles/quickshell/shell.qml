import Quickshell
import Quickshell.Io
import QtQuick
import "modules"
import "./services/"

PanelWindow {
  id: root
  anchors {
    top: true
    left: true
    right: true
  }

  color: "transparent"

  implicitHeight: 30

  Left {}

  Center {}
  
}