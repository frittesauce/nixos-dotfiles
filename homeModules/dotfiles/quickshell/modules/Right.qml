import Quickshell
import Quickshell.Io
import QtQuick.Controls
import QtQuick
import qs.services
import qs
import "right"


Button {
    id: rightRoot
    anchors {
        verticalCenter: parent.verticalCenter
        right: parent.right
        rightMargin: 10
    }
    height: parent.height
    width: childrenRect.width + 40

    background: Rectangle {
        color: Colours.bgcolor
        radius: 15
    }

    onClicked: {
        GlobalStates.qsettingsOpen = !GlobalStates.qsettingsOpen
    }

    Row {
        spacing: 20

        anchors.centerIn: parent


        Power {}

        Clock { }

    }
}