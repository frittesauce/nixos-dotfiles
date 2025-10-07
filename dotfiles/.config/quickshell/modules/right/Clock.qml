import Quickshell
import Quickshell.Io
import QtQuick
import qs.services


Text {
    id: clock
    
    anchors.left: parent
    color: Colours.fgcolor
    font.pixelSize: 20
    font.family: Config.defaultFont

    Process {
      id: dateProc

      command: ["date", "+%H:%M:%S"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: clock.text = this.text
      }
    }

    Timer {
      interval: 1000

      running: true

      repeat: true

      onTriggered: dateProc.running = true
    }
}