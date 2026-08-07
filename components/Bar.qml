import Quickshell
import QtQuick
import ".." as App

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
    implicitHeight: App.Theme.barHeight

    margins {
        top: App.Theme.barMarginTop
        bottom: App.Theme.barMarginBottom
        left: App.Theme.barMarginLeft
        right: App.Theme.barMarginRight
    }

    Rectangle {
        visible: true
        anchors.fill: parent
        implicitWidth: parent.width
        implicitHeight: parent.height

        radius: App.Theme.barRadius
        color: App.Theme.background
        border.color: App.Theme.borderColor

        Area {
            id: leftArea
            color: App.Theme.leftAreaBackground
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }

            Workspaces {
                targetScreen: bar.screen
                area: leftArea
            }

            Media {
                area: leftArea
            }
        }

        Area {
            id: centerArea
            color: App.Theme.centerAreaBackground
            anchors.centerIn: parent

            Clock {
                area: centerArea
            }
        }

        Area {
            id: rightArea
            color: App.Theme.rightAreaBackground
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Dnd {
                area: rightArea
            }

            IdleInhibit {
                area: rightArea
                anchorPanel: bar
            }

            Mic {
                area: rightArea
            }

            Audio {
                area: rightArea
            }

            SysTray {
                area: rightArea
            }
        }
    }
}
