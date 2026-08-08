import Quickshell
import QtQuick
import Quickshell.Wayland
import ".." as App

BarComponent {
    property PanelWindow anchorPanel: area.panel

    id: root
    implicitWidth: App.Theme.iconWidth
    color: inhibitor.enabled ? App.Theme.accentBackground : (mouseArea.containsMouse ? App.Theme.hoverBackground : "transparent")
    radius: App.Theme.areaRadius

    IdleInhibitor {
        id: inhibitor
        window: root.anchorPanel
        enabled: App.State.idleInhibited
    }

    Behavior on color {
        ColorAnimation {
            duration: App.Theme.animationDuration
        }
    }

    BarIcon {
        anchors.centerIn: parent
        text: inhibitor.enabled ? App.Theme.idleInhibitorOnIcon : App.Theme.idleInhibitorOffIcon
        color: inhibitor.enabled ? App.Theme.activeFontColor : App.Theme.fontColor
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
