import qs
import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
pragma Singleton

Singleton {
    id: root

    property bool mediaControlerOpen: false

    property bool qsettingsOpen: true

    property bool sessionOpen: false

}