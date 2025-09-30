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

    property bool showApps: false


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

                Button {
                    background: Rectangle { color: "transparent"}
                    anchors.verticalCenter: parent

                    implicitWidth: childrenRect.width 

                    Text {
                        anchors.centerIn: parent
                        text: ""
                        color: Colours.fgcolor
                        font.family: Config.defaultFont
                        font.pixelSize: 25
                    }
                    onClicked: {
                        root.showApps = !root.showApps
                    }
                }
            }

            ColumnLayout {
                visible: root.showApps
                
                Repeater {
                    model: Audio.appPwNodes

                    delegate: RowLayout {
                        Text {
                            text: modelData.name    // or whatever property each node has
                            color: Colours.fgcolor
                            font.family: Config.defaultFont
                        }
                    

                        Slider {
                            Layout.fillWidth: true
                            from: 0
                            to: 1
                            value: modelData.audio.volume

                            onMoved: {
                                Audio.changeAppVolume(modelData.id ,value)
                            }
                        }
                    }
                }
            }
        }

        implicitHeight: layout.implicitHeight + 20
    }
    
}