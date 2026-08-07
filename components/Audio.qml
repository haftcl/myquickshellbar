import QtQuick.Layouts
import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: layout.implicitWidth + App.Theme.barPadding

    RowLayout {
        id: layout
        spacing: App.Theme.iconSpacing
        anchors.centerIn: parent

        BarIcon {
            text: Services.AudioService.output.audio.muted ? App.Theme.muteIcon : App.Theme.volumeIcon
        }

        BarText {
            text: Services.AudioService.outputVolume()
            font.bold: true
        }
    }

    MouseArea {
        id: mouseArea
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton
        anchors.fill: parent

        onClicked: mouse => {
            Services.AudioService.toggleMute();
        }

        onWheel: wheel => {
            if (wheel.angleDelta.y > 0)
                Services.AudioService.volumeUp();
            else
                Services.AudioService.volumeDown();
        }
    }
}
