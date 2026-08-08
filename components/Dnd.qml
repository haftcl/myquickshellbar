import QtQuick
import ".." as App
import "../services" as Services

BarComponent {
    id: root
    width: height
    color: Services.DndService.dndEnabled ? App.Theme.accentBackground : (mouseArea.containsMouse ? App.Theme.hoverBackground :App.Theme.iconBackground)
    radius: App.Theme.iconRadius

    BarIcon {
        anchors.centerIn: parent
        text: Services.DndService.dndEnabled ? App.Theme.dndOnIcon : App.Theme.dndOffIcon
        color: Services.DndService.dndEnabled ? App.Theme.activeFontColor : App.Theme.fontColor
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: Services.DndService.toggleDndMode()
    }
}
