import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower
import qs.services

Text {
    id: batteryIndicator
    text: `󰁹 ${Battery.percentage}`
    color: Colours.fgcolor
    font.pixelSize: 16
    font.family: Config.defaultFont


    Connections {
        target: battery
        onPercentageChanged: {
            batteryIndicator.text = `󰁹 ${Battery.percentage}`
        }
    }

}
