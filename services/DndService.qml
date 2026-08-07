pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property bool enabled: false

    property Process query: Process {
        command: ["makoctl", "mode"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.enabled = text.includes("dnd")
            }
        }
    }

    property Process toggle: Process {
        command: ["makoctl", "mode", "-t", "dnd"]

    }

    function refresh() {
        if (query.running)
            return

        query.running = true
    }

    function toggleMode() {
        if (toggle.running)
            return

        toggle.running = true
    }

    Component.onCompleted: {
        refresh()
    }
}
