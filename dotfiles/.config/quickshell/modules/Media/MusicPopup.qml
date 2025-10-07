import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io
import Quickshell
import qs.services
import qs.modules.common
import QtQuick.Effects
import Quickshell.Services.Mpris
import Quickshell.Hyprland
import qs

Scope {
    id: playerController


    property var artUrl: MprisController?.activePlayer?.trackArtUrl
    property string artDownloadLocation: Dir.coverArt
    property string artFileName: Qt.md5(artUrl) + ".jpg"
    property string artFilePath: `${artDownloadLocation}/${artFileName}`
    property bool downloaded: false

    Timer {

        running: MprisController.activePlayer.playbackState == MprisController.activePlayer.isPlaying

        interval: 1000
        repeat: true

        onTriggered: MprisController.activePlayer.positionChanged()
    }

    Process { // Cover art downloader
        id: coverArtDownloader
        property string targetFile: playerController.artUrl
        command: [ "bash", "-c", `[ -f ${artFilePath} ] || curl -sSL '${targetFile}' -o '${artFilePath}'` ]
        onExited: (exitCode, exitStatus) => {
            playerController.downloaded = true
        }
    }

    onArtUrlChanged: {
        if (playerController.artUrl.length == 0) {
            return;
        }

        playerController.downloaded = false;
        coverArtDownloader.running = true;
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

            implicitWidth: 350
            implicitHeight: 150
            color: "transparent"

            exclusionMode: ExclusionMode.Ignore

            anchors {
                top: true
            }


            margins {
                top: Config.barHeight + 5
                bottom: 0
            }

            HyprlandFocusGrab {

                windows: [musicControlRoot]
                active: mediaControlersLoader.active
                onCleared: () => {
                    if (!active) {
                        GlobalStates.mediaControlerOpen = false;
                    }
                }
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

                            source: playerController.downloaded ? Qt.resolvedUrl(artFilePath) : ""
                            fillMode: Image.PreserveAspectCrop
                            cache: false
                            asynchronous: true


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
                            elide: Text.ElideRight
                            text: MprisController.activePlayer.trackTitle
                        }

                        Text {
                            id: trackArtist
                            Layout.fillWidth: true
                            font.pixelSize: 16
                            font.family: Config.defaultFont
                            color: Colours.fgcolor
                            elide: Text.ElideRight
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
                                
                                elide: Text.ElideRight

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
                                            anchors.centerIn: parent
                                            height: 4
                                            width: parent.width
                                        } 

                                        contentItem: Item {
                                            anchors.fill: parent

                                            Canvas {
                                                id: wavyFill
                                                anchors {
                                                    left: parent.left
                                                    right: parent.right
                                                    verticalCenter: parent.verticalCenter
                                                }
                                                height: parent.height * 6
                                                onPaint: {
                                                    var ctx = getContext("2d");
                                                    ctx.clearRect(0, 0, width, height);

                                                    var progress = progressBar.visualPosition;
                                                    var fillWidth = progress * width;
                                                    var amplitude = parent.height * 0.5;
                                                    var frequency = 6;
                                                    var phase = Date.now() / 400.0;
                                                    var centerY = height / 2;

                                                    ctx.strokeStyle = Colours.accentblue;
                                                    ctx.lineWidth = parent.height;
                                                    ctx.lineCap = "round";
                                                    ctx.beginPath();
                                                    for (var x = ctx.lineWidth / 2; x <= fillWidth; x += 1) {
                                                        var waveY = centerY + amplitude * Math.sin(frequency * 2 * Math.PI * x / width + phase);
                                                        if (x === 0)
                                                            ctx.moveTo(x, waveY);
                                                        else
                                                            ctx.lineTo(x, waveY);
                                                    }
                                                    ctx.stroke();
                                                }
                                                Connections {
                                                    target: progressBar
                                                    function onValueChanged() { wavyFill.requestPaint(); }
                                                    function onHighlightColorChanged() { wavyFill.requestPaint(); }
                                                }
                                                Timer {
                                                    interval: 1000 / 60
                                                    running: true
                                                    repeat: true
                                                    onTriggered: wavyFill.requestPaint()
                                                }
                                            }
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