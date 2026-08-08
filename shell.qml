//@ pragma UseQApplication
import QtQuick
import Quickshell
import Quickshell.Io
import "components"
import "." as App

ShellRoot {
    IpcHandler {
        target: "idle"

        function toggle(): void {
            App.State.idleInhibited = !App.State.idleInhibited;
        }
    }

    Variants {
        model: Quickshell.screens

        Bar {}
    }
}
