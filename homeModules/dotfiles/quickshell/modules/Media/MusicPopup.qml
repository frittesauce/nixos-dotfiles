import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs.services
import qs.modules.common

Scope {
    id: root

    Timer {

    running: MprisController.activePlayer.playbackState == MprisController.activePlayer.isPlaying

    interval: 1000
    repeat: true

    onTriggered: MprisController.activePlayer.positionChanged()
    }

    Loader {
        id: mediaControlersLoader
        active: GlobalStates.mediaControlerOpen
        onActiveChanged: {
            GlobalStates.mediaControlerOpen = false;
        }

        sourceComponent: PanelWindow {
            id: musicControlRoot
            visible: true

            implicitWidth: 200
            implicitHeight: 150
            color: "transparent"

            exclusionMode: ExclusionMode.Ignore

            anchors {
                top: true
                left: true
                right: true
            }


            margins {
                top: 45
                left: 775
                right: 775
                bottom: 0
            }

            Rectangle {
                anchors.centerIn: parent
                color: Colours.bgcolor

                width: parent.width
                height: parent.height
                radius: 15
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Rectangle {
                        id: artBackground
                        Layout.fillHeight: true
                        implicitWidth: height
                        radius: 10

                        Image {
                            id: mediaArt
                            property int size: parent.height
                            anchors.fill: parent

                            source: MprisController.activePlayer.trackArtUrl
                            fillMode: Image.PreserveAspectCrop

                            cache: false

                            width: size 
                            height: size
                            
                            sourceSize.width: size
                            sourceSize.height: size
                        }
                    }
                    ColumnLayout {
                        Layout.fillHeight: true

                        Text {
                            id: trackTitle
                            Layout.fillWidth: true
                            font.family: Config.defaultFont 
                            font.pixelSize: 20
                            color: Colours.fgcolor
                            elide: text.ElideRight
                            text: MprisController.activePlayer.trackTitle
                        }

                        Text {
                            id: trackArtist
                            Layout.fillWidth: true
                            font.pixelSize: 16
                            font.family: Config.defaultFont
                            color: Colours.fgcolor
                            elide: text.ElideRight
                            text: MprisController.activePlayer.trackArtist
                        }

                        Item { Layout.fillHeight: true }

                        Item {
                            Layout.fillWidth: true
                            implicitHeight: 15

                            Text {
                                id: trackTime

                                anchors.bottom: sliderRow.top
                                anchors.bottomMargin: -3
                                anchors.left: parent.left

                                font.pixelSize: 14
                                font.family: Config.defaultFont

                                color: Colours.fgcolor
                                
                                elide: text.ElideRight

                                text: `${Utils.friendlyTimes(MprisController.activePlayer.position)} / ${Utils.friendlyTimes(MprisController.activePlayer.length)}`

                            }
                            RowLayout {
                                id: sliderRow
                                implicitHeight: 10

                                anchors {
                                    bottom: parent.bottom
                                    left: parent.left
                                    right: parent.right
                                }

                                Button {
                                    id: prevButton
                                    text: "󰒮"
                                    font.pixelSize: 20
                                    font.family: Config.defaultFont
                                    background: Rectangle { color: "transparent"}
                                    contentItem: Text {
                                        text: prevButton.text
                                        font.pixelSize: prevButton.font.pixelSize
                                        font.family: prevButton.font.family
                                        color: Colours.fgcolor
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    onClicked: MprisController.activePlayer.previous()
                                }

                                Item {
                                    id: progressBarCont
                                    Layout.fillWidth: true
                                    implicitHeight: progressBar.implicitHeight

                                    ProgressBar {
                                        id: progressBar
                                        anchors.fill: parent
                                        width: parent.width
                                        implicitHeight: 10

                                        from: 0
                                        to: MprisController.activePlayer.length > 0 ? MprisController.activePlayer.length : 1
                                        value: MprisController.activePlayer.position

                                        background: Rectangle {
                                            color: Colours.accentcolor 
                                            radius: height / 2
                                        }   
                                    }
                                }

                                Button {
                                    id: nextButton
                                    text: "󰒭"
                                    font.pixelSize: 20
                                    font.family: Config.defaultFont
                                    background: Rectangle { color: "transparent"}
                                    contentItem: Text {
                                        text: nextButton.text
                                        font.pixelSize: nextButton.font.pixelSize
                                        font.family: nextButton.font.family
                                        color: Colours.fgcolor
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    onClicked: MprisController.activePlayer.next()
                                }
                            }

                            Button {
                                id: playPauseButton

                                anchors {
                                    right: parent.right
                                    bottom: sliderRow.bottom
                                    bottomMargin: 30
                                }

                                text: MprisController.activePlayer.isPlaying ? "󰏤" : "󰐊"

                                font.pixelSize: 25
                                font.family: Config.defaultFont
                                background: Rectangle { color: "transparent"}
                                contentItem: Text {
                                    text: playPauseButton.text
                                    font.pixelSize: playPauseButton.font.pixelSize
                                    font.family: playPauseButton.font.family
                                    color: Colours.fgcolor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                onClicked: {
                                    MprisController.activePlayer.togglePlaying();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}