import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io
import Quickshell
import Quickshell.Hyprland
import qs
import qs.services

Scope {
    id: session

    Loader {
        id: sessionLoader
        active: GlobalStates.sessionOpen

        onActiveChanged: {
            GlobalStates.sessionOpen = false;
        }

        sourceComponent: PanelWindow {
            id: sessionRoot
            visible: true

            implicitWidth: 116
            implicitHeight: 420

            color: "transparent"
            exclusionMode: ExclusionMode.Ignore
            
            anchors {
                right: true
            }

            
            Keys.onReleased: (event) => {
                if (event.key === Qt.Key_Escape) {
                    GlobalStates.sessionOpen = false;
                    event.accepted = true;
                }
            }

            HyprlandFocusGrab {

                windows: [sessionRoot]
                active: sessionLoader.active
                onCleared: () => {
                    if (!active) {
                        GlobalStates.sessionOpen = false;
                    }
                }
            }

            Rectangle {
                anchors.fill: parent
                color: Colours.bgcolor
                radius: 15
                
                Column {
                    spacing: 5
                    Layout.fillHeight: true
                    padding: 10

                    SessionButton {
                        id: shutdown

                        icon: "⏻"
                        command: ["systemctl", "poweroff"]
                    }

                    SessionButton {
                        id: reboot

                        icon: "󰡣"
                        command: ["systemctl", "reboot"]
                    }

                    SessionButton {
                        id: lock

                        icon: ""
                        command: ["hyprlock"]
                    }

                    SessionButton {
                        id: logout

                        icon: "󰍃"
                        command: ["loginctl", "terminate-user", ""]
                    }

                    component SessionButton: Rectangle {
                        id: button

                        required property string icon
                        required property list<string> command

                        implicitHeight: 95
                        implicitWidth: 95

                        radius: 15
                        color: area.containsMouse ? Colours.accentred : Colours.accentcolor 

                        MouseArea {
                            id: area

                            anchors.fill: parent

                            hoverEnabled: true

                            onClicked: {
                                Quickshell.execDetached(button.command)
                            }
                        }

                        Text {
                            anchors.centerIn: parent

                            text: icon

                            color: area.containsMouse ? Colours.bgcolor : Colours.fgcolor 
                            font.pixelSize: 60
                            font.family: Config.defaultFont 
                            font.weight: 1000
                        }
                    }

                }
            }
        }
    }
}