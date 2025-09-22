pragma Singleton

import Quickshell
import QtQuick
import Qt.labs.platform
import qs.modules.common

Singleton {

    readonly property string home: Quickshell.env("HOME")

    readonly property string cache: StandardPaths.standardLocations(StandardPaths.CacheLocation)[0]

    property string coverArt: Utils.trimFileProtocol(`${Dir.cache}/media/coverart`)
}