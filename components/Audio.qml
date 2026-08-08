import QtQuick.Layouts
import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)
    color: mouseArea.containsMouse ? App.Theme.hoverBackground : App.Theme.audioBackground

    function volumeIcon() {
        var volume = Services.AudioService.outputVolume();

        if (Services.AudioService.outputMuted() || volume == 0) {
            return App.Theme.muteIcon;
        }

        if (volume > 60) {
            return App.Theme.volumeHighIcon;
        }

        if (volume > 30) {
            return App.Theme.volumeIcon;
        }

        return App.Theme.volumeLowIcon;
    }

    RowLayout {
        id: layout
        spacing: App.Theme.iconSpacing
        anchors.centerIn: parent

        BarIcon {
            text: root.volumeIcon()
        }

        BarText {
            text: Services.AudioService.outputVolumeStyled()
            font.bold: true
        }
    }

    MouseArea {
        id: mouseArea
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

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
