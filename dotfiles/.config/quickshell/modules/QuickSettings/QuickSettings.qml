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

Scope {
    id: quickSettings

    Loader {
        id: quickSettingsLoader
        active: GlobalStates.qsettingsOpen

        onActiveChanged: {
            GlobalStates.qsettingsOpen = false;
        }

        sourceComponent: PanelWindow {
            id: quickSettingsRoot
            visible: true

            implicitWidth: 500
            implicitHeight: 300

            color: "transparent"
            exclusionMode: ExclusionMode.Ignore
            
            anchors {
                right: true
                top: true
            }

            margins {
                top: Config.barHeight + 5
            }

            HyprlandFocusGrab {

                windows: [quickSettingsRoot]
                active: quickSettingsLoader.active
                onCleared: () => {
                    if (!active) {
                        GlobalStates.qsettingsOpen = false;
                    }
                }
            }

            QSContent {}
        }
    }
}