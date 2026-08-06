import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import ".." as App

Rectangle {
    id: root

    color: App.Theme.systrayBackground
    radius: App.Theme.areaRadius
    implicitWidth: layout.implicitWidth + App.Theme.iconSpacing
    implicitHeight: App.Theme.barHeight - App.Theme.barPadding

    RowLayout {
        id: layout

        anchors.centerIn: parent
        spacing: App.Theme.iconSpacing

        Repeater {
            // SystemTray.items is a map/list of active StatusNotifierItems
            model: SystemTray.items

            delegate: Rectangle {
                id: item
                required property SystemTrayItem modelData

                width: App.Theme.iconWidth
                implicitHeight: App.Theme.barHeight - App.Theme.barPadding
                radius: App.Theme.areaRadius
                color: mouseArea.containsMouse ? App.Theme.hoverBackground : "transparent"

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
                    anchor.margins.top: App.Theme.barHeight + 5
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
