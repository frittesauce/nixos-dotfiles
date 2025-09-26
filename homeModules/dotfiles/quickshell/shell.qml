import Quickshell
import Quickshell.Io
import QtQuick
import "modules"
import "./services/"
import "GlobalStates"
import "modules/Media"
import "modules/QuickSettings"
import "modules/Session"

ShellRoot {


  Variants {
    model: Quickshell.screens
    Scope {
      id: root
      required property var modelData
      Bar {
        screen: modelData
      }
    }
  }

  LazyLoader { active: GlobalStates.mediaControlerOpen ; component: MusicPopup {}}

  LazyLoader { active: GlobalStates.qsettingsOpen ; component: QuickSettings {}}

  LazyLoader { active: GlobalStates.sessionOpen ; component: Session {}}
}