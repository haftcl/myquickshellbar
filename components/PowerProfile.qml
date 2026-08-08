import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: App.Theme.iconWidth
    radius: App.Theme.areaRadius
    color: mouseArea.containsMouse ? App.Theme.hoverBackground : "transparent"

    BarIcon {
        id: icon
        anchors.centerIn: parent

        text: {
            switch (Services.PowerProfileService.profile) {
            case "performance":
                return App.Theme.powerProfilePerformanceIcon;
            case "balanced":
                return App.Theme.powerProfileBalancedIcon;
            case "power-saver":
                return App.Theme.powerProfilePowerSaverIcon;
            }
        }

        color: {
            switch (Services.PowerProfileService.profile) {
            case "performance":
                return App.Theme.powerProfilePerformanceColor ?? App.Theme.fontColor;
            case "balanced":
                return App.Theme.powerProfileBalancedColor ?? App.Theme.fontColor;
            case "power-saver":
                return App.Theme.powerProfilePowerSaverColor ?? App.Theme.fontColor;
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: Services.PowerProfileService.cyclePowerProfile()
    }
}
