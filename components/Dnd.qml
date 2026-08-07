import QtQuick
import ".." as App
import "../services" as Services

BarComponent {
    id: root

    implicitWidth: App.Theme.iconWidth

    Rectangle {
        anchors.fill: parent
        color: Services.DndService.enabled ? App.Theme.accentBackground : (mouseArea.containsMouse ? App.Theme.hoverBackground : "transparent")
        radius: App.Theme.areaRadius

        Behavior on color {
            ColorAnimation {
                duration: App.Theme.animationDuration
            }
        }

        BarIcon {
            anchors.centerIn: parent
            text: Services.DndService.enabled ? App.Theme.dndOnIcon : App.Theme.dndOffIcon
            color: Services.DndService.enabled || mouseArea.containsMouse ? App.Theme.activeFontColor : App.Theme.fontColor
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: Services.DndService.toggleMode()
        }

        Timer {
            interval: 2000
            running: true
            repeat: true

            onTriggered: Services.DndService.refresh()
        }
    }
}
