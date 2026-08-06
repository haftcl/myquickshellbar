import QtQuick.Layouts
import QtQuick
import "../theme"
import Quickshell.Hyprland
import Quickshell

Rectangle {
    id: root

    required property ShellScreen targetScreen

    implicitHeight: parent.height - Theme.barPadding
    implicitWidth: layout.implicitWidth + Theme.iconSpacing

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: Theme.iconSpacing

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

                implicitWidth: Theme.iconWidth
                implicitHeight: Theme.barHeight - Theme.barPadding
                radius: Theme.areaRadius

                // Individual button styling
                color: isActive
                        ? Theme.accentBackground
                        : (mouseArea.containsMouse ? Theme.hoverBackground : Theme.workspaceBackground)

                // Smooth hover transition effect
                Behavior on color {
                    ColorAnimation {
                        duration: Theme.animationDuration
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: Theme.workspacesIconMap[parent.modelData.name] ?? parent.modelData.name
                    color: parent.isActive || mouseArea.containsMouse ? Theme.activeFontColor : Theme.fontColor
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.workspacesIconMap[parent.modelData.name] ? Theme.iconSize : Theme.fontSize
                    font.bold: Theme.workspacesIconMap[parent.modelData.name] ? false : true
                    renderType: Text.NativeRendering
                    font.hintingPreference: Font.PreferFullHinting

                    Behavior on color {
                        ColorAnimation {
                            duration: Theme.animationDuration
                        }
                    }
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
