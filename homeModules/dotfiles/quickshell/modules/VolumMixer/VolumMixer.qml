import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs

Item {
    // readonly property list<PwNode> appPwNodes: Pipewire.nodes.values.filter((node) => {
    //     return node.isSink && node.isStream
    // })


    ColumnLayout {
        // Repeater {
        //     model: ScriptModel {
        //         values: Pipewire.nodes.values.filter((node) => {
        //             return node.isSink && node.isStream
        //         })
        //     }

        //     delegate: Text {
        //         required property var modelData

        //         text: modelData.name
        //     }
        // }
    }
}