pragma Singleton
import Quickshell

Singleton {
    id: root

    function friendlyTimes(seconds) {
        if (isNaN(seconds)  || seconds < 0) {
            return "0:00";
        }

        seconds = Math.floor(seconds);

        const h = Math.floor(seconds / 3600);
        const m = Math.floor((seconds % 3600) / 60);
        const s = seconds % 60;

        if (h > 0) {
            return h + ":" + (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;
        } else {
            return m + ":" + (s < 10 ? "0" : "") + s;
        }
    }


    function trimFileProtocol(str) {
        let s = str;
        if (typeof s !== "string") s = str.toString(); // Convert to string if it's an url or whatever
        return s.startsWith("file://") ? s.slice(7) : s;
    }
}