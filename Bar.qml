import Quickshell
import QtQuick
import "components"
import "theme"

PanelWindow {
    id: bar
    anchors {
        top: true
        left: true
        right: true
    }

    // Require the screen property to be provided by shell.qml
    required property ShellScreen modelData
    screen: modelData

    color: "transparent"
    implicitHeight: Theme.barHeight

    margins {
        top: Theme.barMarginTop
        bottom: Theme.barMarginBottom
        left: Theme.barMarginLeft
        right: Theme.barMarginRight
    }

    Rectangle {
        anchors.fill: parent
        width: parent.width
        height: parent.height

        radius: Theme.barRadius
        color: Theme.background
        border.color: Theme.borderColor

        Workspaces {
            targetScreen: bar.screen
        }
        Clock {}
        SysTray {}
    }
}
