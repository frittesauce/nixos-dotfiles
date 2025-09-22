import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io
import Quickshell
import Quickshell.Hyprland
import QtQuick.Effects
import qs.modules.QuickSettings
import qs.modules.common
import qs.services
import qs


Rectangle {
    anchors.fill: parent
    color: Colours.bgcolor
    radius: 15


    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        RowLayout {
            spacing: 15
            Layout.fillWidth: true

            Rectangle {
                id: iconBg
                
                Layout.preferredHeight: 85
                Layout.preferredWidth: 85

                implicitWidth: height
                radius: 10

                Image {
                    id: icon
                    property int size: parent.height
                    anchors.fill: parent

                    height: size
                    width: size
                    

                    sourceSize.width: size
                    sourceSize.height: size

                    fillMode: Image.PreserveAspectCrop
                    
                    source: Qt.resolvedUrl(`${Dir.home}/icon.png`)
                    asynchronous: true
                    // cache: true

                }
            }   

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                Text {
                    text: ` : ${SysInfo.curUser}`
                    font.pixelSize: 20
                    font.family: Config.defaultFont 
                    color: Colours.fgcolor
                } 
                Text {
                    text: ` : ${SysInfo.osName}`
                    font.pixelSize: 20
                    font.family: Config.defaultFont 
                    color: Colours.fgcolor
                } 
                
                Text {
                    text: `󰥔 : ${SysInfo.uptime}`
                    font.pixelSize: 20
                    font.family: Config.defaultFont 
                    color: Colours.fgcolor
                } 
                
            }
            Item { Layout.fillWidth: true }

            Button {
                id: powerButton

                Layout.preferredHeight: 85
                Layout.preferredWidth: 85
                
                Layout.alignment: Qt.AlignVCenter

                background: Rectangle {
                    color: "transparent"
                }

                Text {
                    text: "⏻"
                    color: Colours.accentred
                    font.pixelSize: 60
                    font.family: Config.defaultFont 
                }
                
                onClicked: {
                    GlobalStates.qsettingsOpen = false;
                }
            }
        }

        Item { Layout.fillHeight: true }

        ColumnLayout {
            Layout.fillWidth: true

        }
    }
}