import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower
import qs.services

Text {
    id: batteryIndicator
    text: Battery.percentage
    color: "#CDD6F4"


    Connections {
        target: battery
        onPercentageChanged: {
            batteryIndicator.text = Battery.percentage
        }
    }

}
