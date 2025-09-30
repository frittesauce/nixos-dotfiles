import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import qs
import qs.services

Item {
    id: root
    Layout.fillWidth: true

    implicitHeight: contentItem.implicitHeight


    Item {
        id: contentItem
        anchors.fill: parent
        anchors.margins: 16 // Margin around sliders

        ColumnLayout {
            id: layout
            anchors.fill: parent
            spacing: 20

            RowLayout {
                Text {
                    text: ""
                    font.pixelSize: 25
                    font.family: Config.defaultFont 
                    color: Colours.fgcolor
                }

                Slider {
                    Layout.fillWidth: true
                    from: 0
                    to: 1
                    value: Audio.volume

                    onMoved: {
                        Audio.setVolume(value)
                        console.log(JSON.stringify(Audio, null, 2))
                    }

                }
            }
            

        }

        implicitHeight: layout.implicitHeight + 20
    }
    
}