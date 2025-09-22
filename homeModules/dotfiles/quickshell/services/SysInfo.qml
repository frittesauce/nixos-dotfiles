pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property string osName
    property string osPrettyName
    readonly property string curUser: Quickshell.env("USER")

    property string uptime

    FileView {
        id: osRelease

        path: "/etc/os-release"

        onLoaded: {
            const lines = text().split("\n");

            const fd = key => lines.find(l => l.startsWith(`${key}=`))?.split("=")[1].replace(/"/g, "") ?? "";

            root.osName = fd("NAME");
            root.osPrettyName = fd("PRETTY_NAME");
        }
    }

    Timer {
        running: true
        repeat: true
        interval: 15000
        onTriggered: fileUptime.reload()
    }


    FileView {
        id: fileUptime

        path: "/proc/uptime"
        onLoaded: {
            const up = parseInt(text().split(" ")[0] ?? 0);

            const days = Math.floor(up / 86400);
            const hours = Math.floor((up % 86400) / 3600);
            const minutes = Math.floor((up % 3600) / 60);

            let str = "";
            if (days > 0)
                str += `${days} day${days === 1 ? "" : "s"}`;
            if (hours > 0)
                str += `${str ? ", " : ""}${hours} hour${hours === 1 ? "" : "s"}`;
            if (minutes > 0 || !str)
                str += `${str ? ", " : ""}${minutes} minute${minutes === 1 ? "" : "s"}`;
            root.uptime = str;
        }
    }
}