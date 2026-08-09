//@ pragma UseQApplication
import QtQuick
import Quickshell
import Quickshell.Io
import "components"
import "." as App

ShellRoot {
    IpcHandler {
        target: "bar"

        function toggleInhibit(): void {
            App.State.idleInhibited = !App.State.idleInhibited;
        }

        function toggleBar(): void {
            App.State.barVisible = !App.State.barVisible;
        }
    }

    Variants {
        model: Quickshell.screens

        Bar {}
    }
}
