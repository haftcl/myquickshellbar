import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import ".." as App

BarComponent {
    id: root

    color: App.Theme.systrayBackground
    implicitWidth: calculateWidth(layout.implicitWidth)

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
                implicitHeight: root.calculateHeight(root.height)
                radius: App.Theme.areaRadius
                color: mouseArea.containsMouse ? App.Theme.systrayHoverBackground : "transparent"

                // Tray Icon
                Image {
                    anchors.centerIn: parent
                    width: root.calculateHeight(item.height)
                    height:  root.calculateHeight(item.height)

                    source: parent.modelData.icon
                    smooth: true
                    antialiasing: true
                }

                QsMenuAnchor {
                    id: menuAnchor
                    menu: item.modelData.menu
                    anchor.item: item
                    anchor.margins.top: App.Theme.barHeight
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
