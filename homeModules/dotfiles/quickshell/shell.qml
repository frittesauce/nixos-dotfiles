import Quickshell
import Quickshell.Io
import QtQuick
import "modules"
import "./services/"
import "GlobalStates"
import "modules/Media"

ShellRoot {

  PanelWindow {
    id: root
    anchors {
      top: true
      left: true
      right: true
    }

    color: "transparent"

    implicitHeight: 40
    Rectangle {
      color: "transparent"
      anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
      }
        implicitHeight: 35
        width: parent.width 
      Left {}

      Center {}
    }
  }
 LazyLoader { active: GlobalStates.mediaControlerOpen ; component: MusicPopup {}}
}