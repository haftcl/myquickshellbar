import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import "../theme"

Rectangle {
    id: root

    color: Theme.systrayBackground
    radius: Theme.areaRadius
    border.width: 0
    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right
    anchors.rightMargin: 2

    width: layout.implicitWidth + 5
    height: Theme.barHeight - 2

    RowLayout {
        id: layout

        anchors.centerIn: parent
        spacing: 5

        Repeater {
            // SystemTray.items is a map/list of active StatusNotifierItems
            model: SystemTray.items

            delegate: Rectangle {
                id: item
                required property SystemTrayItem modelData

                width: 25
                height: Theme.barHeight
                radius: 4
                color: mouseArea.containsMouse ? Theme.systrayHoverBackground : "transparent"

                // Tray Icon
                Image {
                    anchors.centerIn: parent
                    width: 22
                    height: 22

                    source: parent.modelData.icon
                    smooth: true
                    antialiasing: true
                }

                QsMenuAnchor {
                    id: menuAnchor
                    menu: item.modelData.menu
                    anchor.item: item
                    anchor.margins.top: Theme.barHeight + 5
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton | Qt.RightButton

                    cursorShape: Qt.PointingHandCursor

                    onClicked: mouse => {
                        if (mouse.button === Qt.LeftButton) {
                            parent.modelData.activate();
                        } else if (mouse.button === Qt.RightButton) {
                            if (item.modelData.hasMenu) {
                                menuAnchor.open()
                            }
                        }
                    }
                }
            }
        }
    }
}
