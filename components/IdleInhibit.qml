import QtQuick
import Quickshell.Wayland
import "../theme"

Item {
    id: root
    width: Theme.iconWidth
    height: Theme.barHeight - Theme.barPadding
    visible: true

    IdleInhibitor {
        id: inhibitor
        window: root.parent.parent
        enabled: false
    }

    Rectangle {
        anchors.fill: parent
        color: inhibitor.enabled ? Theme.accentBackground : (mouseArea.containsMouse ? Theme.hoverBackground : "transparent")
        radius: Theme.areaRadius

        Behavior on color {
            ColorAnimation {
                duration: Theme.animationDuration
            }
        }

        // Icon text/symbol (replace with an Image or Icon component if using icon themes)
        Text {
            anchors.centerIn: parent
            text: inhibitor.enabled ? Theme.idleInhibitorOnIcon : Theme.idleInhibitorOffIcon
            color: inhibitor.enabled || mouseArea.containsMouse ? Theme.activeFontColor : Theme.fontColor
            font.pixelSize: Theme.iconSize

            Behavior on color {
                ColorAnimation {
                    duration: Theme.animationDuration
                }
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                inhibitor.enabled = !inhibitor.enabled;
            }
        }
    }
}
