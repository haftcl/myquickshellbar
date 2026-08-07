pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property string profile: "balanced"

    property Process queryPowerProfile: Process {
        command: ["powerprofilesctl", "get"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.profile = text.trim()
            }
        }
    }

    property Timer powerProfileTimer: Timer {
        interval: 2000
        repeat: true
        running: true

        onTriggered: {
            root.queryPowerProfile.running = true
        }
    }

    function refreshPowerProfileMode() {
        queryPowerProfile.running = true
    }

    function cyclePowerProfile() {
        switch (profile) {
        case "performance":
            exec.command = ["powerprofilesctl", "set", "balanced"]
            break

        case "balanced":
            exec.command = ["powerprofilesctl", "set", "power-saver"]
            break

        default:
            exec.command = ["powerprofilesctl", "set", "performance"]
        }

        exec.running = true
    }

    property Process exec: Process {
        command: []

        onExited: root.refreshPowerProfileMode()
    }

    Component.onCompleted: {
        root.refreshPowerProfileMode()
    }
}
