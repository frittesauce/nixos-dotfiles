import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Services.Mpris 
import qs.services

Button {
    id: music
    width: 200
    height: 45
    readonly property MprisPlayer activePlayer: MprisController.activePlayer

    background: Rectangle {
        color: "transparent"
    }

    clip: true // cut off overflow text

    Item {
        id: scrollBox
        anchors.fill: parent

        Text {
            id: trackLabel
            text: activePlayer.trackTitle + " - " + activePlayer.trackArtist
            color: Colours.fgcolor
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter

            width: paintedWidth
            height: paintedHeight

            // scroll animation
            SequentialAnimation on x {
                id: scrollAnim
                running: trackLabel.paintedWidth > scrollBox.width 
                loops: Animation.Infinite

                NumberAnimation {
                    from: 0
                    to: -(trackLabel.paintedWidth - scrollBox.width)
                    duration: 10000
                    easing.type: Easing.Linear
                }
                PauseAnimation { duration: 450 }
                NumberAnimation {
                    from: -(trackLabel.paintedWidth - scrollBox.width)
                    to: 0
                    duration: 10000
                    easing.type: Easing.Linear
                }
                PauseAnimation { duration: 450 } 
            }
        }
    }

    onClicked: {
        activePlayer.togglePlaying()
    }
}
