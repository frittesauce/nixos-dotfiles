import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Services.Mpris 
import qs.services
import qs

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
        anchors.fill: parent
        anchors.centerIn: parent

        Text {
            id: trackLabel
            text: activePlayer.trackTitle + " - " + activePlayer.trackArtist
            color: Colours.fgcolor
            font.pixelSize: 20
            font.family: Config.defaultFont
            anchors.verticalCenter: parent.verticalCenter

            width: paintedWidth
            height: paintedHeight

        }
    }

    onClicked: {
        GlobalStates.mediaControlerOpen = !GlobalStates.mediaControlerOpen
        // console.log(MprisController.activePlayer)
    }
    
}
