//@ pragma UseQApplication
import QtQuick
import Quickshell
import "components"

ShellRoot {
    Variants {
        model: Quickshell.screens

        Bar { }
    }
}
