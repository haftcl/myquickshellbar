import Quickshell
import QtQuick
import Quickshell.Wayland
import ".." as App

BarComponent {
    id: root
    property PanelWindow anchorPanel: area.panel
    color: inhibitor.enabled ? App.Theme.accentBackground : (mouseArea.containsMouse ? App.Theme.hoverBackground : App.Theme.iconBackground)
    width: height
    radius: App.Theme.iconRadius

    IdleInhibitor {
        id: inhibitor
        window: root.anchorPanel
        enabled: App.State.idleInhibited
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
