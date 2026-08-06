import QtQuick.Layouts
import QtQuick
import "../theme"
import Quickshell.Hyprland
import Quickshell

Rectangle {
    id: root

    required property ShellScreen targetScreen

    anchors {
        left: parent.left
        leftMargin: 2
        verticalCenter: parent.verticalCenter
    }

    radius: Theme.areaRadius
    color: Theme.leftAreaBackground
    height: parent.height
    width: layout.implicitWidth + 5

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: 5

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

                implicitWidth: 25
                implicitHeight: Theme.barHeight - 4
                radius: Theme.workspaceIconRadius

                // Individual button styling
                color: isActive
                        ? Theme.accentBackground
                        : (mouseArea.containsMouse ? Theme.hoverBackground : Theme.workspaceBackground)

                // Smooth hover transition effect
                Behavior on color {
                    ColorAnimation {
                        duration: 120
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: Theme.iconMap[parent.modelData.name] ?? parent.modelData.name
                    color: parent.isActive || mouseArea.containsMouse ? Theme.activeFontColor : Theme.fontColor
                    font.family: Theme.fontFamily
                    font.pointSize: Theme.iconMap[parent.modelData.name] ? Theme.iconSize : Theme.fontSize
                    font.bold: Theme.iconMap[parent.modelData.name] ? false : true
                    renderType: Text.NativeRendering
                    font.hintingPreference: Font.PreferFullHinting
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
