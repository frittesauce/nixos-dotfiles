pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.Pipewire


Singleton {
    id: root

    
    readonly property PwNode sink: Pipewire.defaultAudioSink
    
    PwObjectTracker {
        objects: [...root.sinks, ...root.sources]
    }

    readonly property real volume: sink?.audio?.volume ?? 0

    readonly property var nodes: Pipewire.nodes.values.reduce((acc, node) => {
            if (!node.isStream) {
                if (node.isSink)
                    acc.sinks.push(node);
                else if (node.audio)
                    acc.sources.push(node);
            }
            return acc;
        }, {
            sources: [],
            sinks: []
    })

    readonly property list<PwNode> sinks: nodes.sinks
    readonly property list<PwNode> sources: nodes.sources

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