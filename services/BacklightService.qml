pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property string brightnessPercent

    property Process queryBacklight: Process {
        command: ["brightnessctl", "info"]

        stdout: SplitParser {
            onRead: data => {
                // Regex matches digits inside parentheses before %
                let match = data.match(/\((\d+)%\)/);
                if (match) {
                    root.brightnessPercent = parseInt(match[1]);
                }
            }
        }
    }

    property Timer backlightTimer: Timer {
        interval: 5000
        repeat: true
        running: true

        onTriggered: {
            root.refreshBacklight()
        }
    }

    function refreshBacklight() {
        queryBacklight.running = true;
    }

    function brightnessDown() {
        modifyBacklight.command = ["brightnessctl", "set", "5%-"];
        modifyBacklight.running = true;
    }

    function brightnessUp() {
        modifyBacklight.command = ["brightnessctl", "set", "+5%"];
        modifyBacklight.running = true;
    }

    property Process modifyBacklight: Process {
        command: []

        onExited: root.refreshBacklight()
    }

    Component.onCompleted: {
        root.refreshBacklight();
    }
}
