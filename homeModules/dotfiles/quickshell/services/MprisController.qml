pragma Singleton
import Quickshell 
import Quickshell.Services.Mpris 
import qs.services

Singleton {
    id: root

	property MprisPlayer trackedPlayer: null;
	property MprisPlayer activePlayer: trackedPlayer ?? Mpris.players.values[0] ?? null;


    function togglePlaying() {
        this.activePlayer.togglePlaying();
    }
}
