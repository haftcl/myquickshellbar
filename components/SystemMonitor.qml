import QtQuick.Layouts
import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)
    color: App.Theme.systemMonitorBackground
    visible: showCpu || showCpuTemp || showGpu || showRam

    property bool showCpu: false
    property bool showCpuTemp: false
    property bool showGpu: false
    property bool showRam: false

    RowLayout {
        id: layout
        spacing: App.Theme.componentSpacing
        anchors.centerIn: parent

        RowLayout {
            spacing: App.Theme.iconSpacing
            visible: root.showCpu

            BarIcon {
                text: App.Theme.cpuIcon
            }

            BarText {
                text: `${Services.SystemMonitorService.cpuPercent}%`
                font.bold: true
            }
        }

        RowLayout {
            spacing: App.Theme.iconSpacing
            visible: root.showCpuTemp

            BarIcon {
                text: App.Theme.cpuTempIcon
                color: Services.SystemMonitorService.cpuTempCelsius > App.Theme.cpuTempWarningThreshold ? App.Theme.cpuTempWarningColor : App.Theme.fontColor
            }

            BarText {
                text: `${Services.SystemMonitorService.cpuTempCelsius}°`
                font.bold: true
            }
        }

        RowLayout {
            spacing: App.Theme.iconSpacing
            visible: root.showGpu

            BarIcon {
                text: App.Theme.gpuIcon
            }

            BarText {
                text: `${Services.SystemMonitorService.gpuPercent}%`
                font.bold: true
            }
        }

        RowLayout {
            spacing: App.Theme.iconSpacing
            visible: root.showRam

            BarIcon {
                text: App.Theme.ramIcon
            }

            BarText {
                text: `${Services.SystemMonitorService.ramPercent}%`
                font.bold: true
            }
        }
    }
}
