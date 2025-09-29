pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.Pipewire


Singleton {
    id: root

    
    readonly property PwNode sink: Pipewire.defaultAudioSink
    
    PwObjectTracker {
        objects: [sink]
    }

    readonly property real volume: sink?.audio?.volume ?? 0


    function setVolume(newVolume: real): void {
        if (sink?.ready && sink?.audio) {
            sink.audio.muted = false;
            sink.audio.volume = Math.max(0, Math.min(1, newVolume));
        }
    }

    onSinkChanged: {
        if (!sink?.ready)
            return;
    }

}