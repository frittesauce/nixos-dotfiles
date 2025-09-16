import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Services.Mpris 
import qs.services


Button {
    id: music
    

    readonly property MprisPlayer activePlayer: MprisController.activePlayer
    
    text: activePlayer.trackTitle + " - " + activePlayer.trackArtist

    onClicked: {
        activePlayer.togglePlaying()
    }
}
