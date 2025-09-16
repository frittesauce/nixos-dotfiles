pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.UPower


Singleton {
    id: root
    property real percentage: Math.round(UPower.displayDevice.percentage * 100)

    onPercentageChanged: {}

    Timer {
        // interval: 1000
        running: true
        repeat: true
        onTriggered: percentage = UPower.displayDevice.percentage * 100
    }
}
