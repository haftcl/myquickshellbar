import QtQuick.Layouts
import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: layout.implicitWidth + App.Theme.barPadding
    visible: area.panel.screen.name === "eDP-1"

    RowLayout {
        id: layout
        spacing: App.Theme.iconSpacing
        anchors.centerIn: parent

        BarIcon {
            text: {
                if (Services.BacklightService.brightnessPercent > 70) {
                    return App.Theme.backlightFullIcon;
                }

                if (Services.BacklightService.brightnessPercent > 30) {
                    return App.Theme.backlightMediumIcon;
                }

                return App.Theme.backlightLowIcon;
            }
        }

        BarText {
            text: `${Services.BacklightService.brightnessPercent}%`
            font.bold: true
        }
    }

    MouseArea {
        id: mouseArea
        acceptedButtons: Qt.MiddleButton
        anchors.fill: parent

        onWheel: wheel => {
            if (wheel.angleDelta.y > 0)
                Services.BacklightService.brightnessUp()
            else
                Services.BacklightService.brightnessDown();
        }
    }
}
