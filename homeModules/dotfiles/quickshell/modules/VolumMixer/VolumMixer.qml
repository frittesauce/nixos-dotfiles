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
            
            Slider {
                Layout.fillWidth: true
                from: 0
                to: 1
                value: Audio.volume

                onMoved: {
                    Audio.setVolume(value)
                }

            }

        }

        implicitHeight: layout.implicitHeight + 20
    }
    
}