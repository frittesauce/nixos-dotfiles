import Quickshell
import Quickshell.Io
import QtQuick


Text {
    id: clock
    
    anchors.left: parent

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