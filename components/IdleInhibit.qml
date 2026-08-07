import Quickshell
import QtQuick
import Quickshell.Wayland
import ".." as App

Item {
    required property PanelWindow anchorPanel
    id: root
    width: App.Theme.iconWidth
    height: App.Theme.barHeight - App.Theme.barPadding

    IdleInhibitor {
        id: inhibitor
        window: root.anchorPanel
        enabled: App.State.idleInhibited
    }

    Rectangle {
        anchors.fill: parent
        color: inhibitor.enabled ? App.Theme.accentBackground : (mouseArea.containsMouse ? App.Theme.hoverBackground : "transparent")
        radius: App.Theme.areaRadius

        Behavior on color {
            ColorAnimation {
                duration: App.Theme.animationDuration
            }
        }

        // Icon text/symbol (replace with an Image or Icon component if using icon themes)
        BarIcon {
            anchors.centerIn: parent
            text: inhibitor.enabled ? App.Theme.idleInhibitorOnIcon : App.Theme.idleInhibitorOffIcon
            color: inhibitor.enabled || mouseArea.containsMouse ? App.Theme.activeFontColor : App.Theme.fontColor
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                App.State.idleInhibited = !App.State.idleInhibited;
                inhibitor.enabled = App.State.idleInhibited;
            }
        }
    }
}
