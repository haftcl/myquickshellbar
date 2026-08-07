pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property bool dndEnabled: false

    property Process query: Process {
        command: ["makoctl", "mode"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.dndEnabled = text.includes("dnd")
            }
        }
    }

    property Timer dndTimer: Timer {
        interval: 2000
        running: true
        repeat: true

        onTriggered: root.refreshDndStatus()
    }

    property Process toggle: Process {
        command: ["makoctl", "mode", "-t", "dnd"]

    }

    function refreshDndStatus() {
        if (query.running)
            return

        query.running = true
    }

    function toggleDndMode() {
        if (toggle.running)
            return

        toggle.running = true
    }

    Component.onCompleted: {
        refreshDndStatus()
    }
}
