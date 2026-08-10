import Quickshell
import Quickshell.Services.UPower
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)
    color: App.Theme.batteryBackground

    property var battery: {
        for (const device of UPower.devices.values) {
            if (device.isLaptopBattery) {
                battery = device;
                break;
            }
        }

        return null
    }

    visible: battery != null

    RowLayout {
        id: layout
        spacing: App.Theme.iconSpacing
        anchors.centerIn: parent

        IconImage {
            source: Quickshell.iconPath(root.battery?.iconName, 'battery-full-symbolic')
            implicitSize: App.Theme.iconSize
        }

        BarText {
            text: Math.round(root.battery?.percentage * 100) + "%"
            font.bold: true
        }
    }
}
