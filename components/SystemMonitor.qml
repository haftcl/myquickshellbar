pragma ComponentBehavior: Bound

import QtQuick.Layouts
import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)
    color: App.Theme.systemMonitorBackground
    visible: metrics.length > 0

    // Controls both which metrics are shown and the metrics they appear in.
    // Valid keys: "cpu", "cpuTemp", "gpu", "ram"
    property var metrics: ["cpuTemp", "cpu", "gpu", "ram"]

    function metricIcon(key) {
        switch (key) {
        case "cpu":
            return App.Theme.cpuIcon;
        case "cpuTemp":
            return App.Theme.cpuTempIcon;
        case "gpu":
            return App.Theme.gpuIcon;
        case "ram":
            return App.Theme.ramIcon;
        default:
            return "";
        }
    }

    function metricIconColor(key) {
        if (key === "cpuTemp" && Services.SystemMonitorService.cpuTempCelsius > App.Theme.cpuTempWarningThreshold) {
            return App.Theme.cpuTempWarningColor;
        }

        return App.Theme.fontColor;
    }

    function metricValue(key) {
        switch (key) {
        case "cpu":
            return `${Services.SystemMonitorService.cpuPercent}%`;
        case "cpuTemp":
            return `${Services.SystemMonitorService.cpuTempCelsius}°`;
        case "gpu":
            return `${Services.SystemMonitorService.gpuPercent}%`;
        case "ram":
            return `${Services.SystemMonitorService.ramPercent}%`;
        default:
            return "";
        }
    }

    RowLayout {
        id: layout
        spacing: App.Theme.componentSpacing
        anchors.centerIn: parent

        Repeater {
            model: root.metrics

            RowLayout {
                id: metric
                required property string modelData

                spacing: App.Theme.iconSpacing

                BarIcon {
                    text: root.metricIcon(metric.modelData)
                    color: root.metricIconColor(metric.modelData)
                }

                BarText {
                    text: root.metricValue(metric.modelData)
                    font.bold: true
                }
            }
        }
    }
}
