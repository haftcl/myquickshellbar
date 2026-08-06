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
    visible: true

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
        visible: true
        anchors.fill: parent
        implicitWidth: parent.width
        implicitHeight: parent.height

        radius: Theme.barRadius
        color: Theme.background
        border.color: Theme.borderColor

        Area {
            color: Theme.leftAreaBackground
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }

            Workspaces {
                targetScreen: bar.screen
            }
        }

        Area {
            color: Theme.centerAreaBackground
            anchors.centerIn: parent

            Clock {}
        }

        Area {
            color: Theme.rightAreaBackground
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            IdleInhibit {}

            SysTray {}
        }
    }
}
