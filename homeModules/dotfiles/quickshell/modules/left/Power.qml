import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower
import qs.services

Text {
    id: batteryIndicator
    text: Battery.percentage


    Connections {
        target: battery
        onPercentageChanged: {
            batteryIndicator.text = Battery.percentage
        }
    }

}
