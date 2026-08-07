import QtQuick.Layouts
import QtQuick
import Quickshell.Hyprland
import Quickshell
import ".." as App

Widget {
    id: root

    required property ShellScreen targetScreen

    implicitWidth: layout.implicitWidth + App.Theme.iconSpacing

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: App.Theme.iconSpacing

        Repeater {
            // Filter workspaces for this screen
            model: Hyprland.workspaces.values.filter(ws => {
                const isCorrectMonitor = ws.monitor && ws.monitor.name === root.targetScreen.name;
                const isNormalWorkspace = !ws.name.startsWith("special:");

                return isCorrectMonitor && isNormalWorkspace;
            }).sort((a, b) => a.name.localeCompare(b.name, undefined, { numeric: true, sensitivity: 'base' }))

            delegate: Rectangle {
                required property HyprlandWorkspace modelData
                property bool isActive: modelData.active

                implicitWidth: App.Theme.iconWidth
                implicitHeight: App.Theme.barHeight - App.Theme.barPadding
                radius: App.Theme.areaRadius

                // Individual button styling
                color: isActive
                        ? App.Theme.accentBackground
                        : (mouseArea.containsMouse ? App.Theme.hoverBackground : App.Theme.workspaceBackground)

                // Smooth hover transition effect
                Behavior on color {
                    ColorAnimation {
                        duration: App.Theme.animationDuration
                    }
                }

                BarText {
                    anchors.centerIn: parent
                    text: App.Theme.workspacesIconMap[parent.modelData.name] ?? parent.modelData.name
                    color: parent.isActive || mouseArea.containsMouse ? App.Theme.activeFontColor : App.Theme.fontColor
                    font.pixelSize: App.Theme.workspacesIconMap[parent.modelData.name] ? App.Theme.iconSize : App.Theme.fontSize
                    font.bold: App.Theme.workspacesIconMap[parent.modelData.name] ? false : true
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        parent.modelData.activate();
                    }
                }
            }
        }
    }
}
