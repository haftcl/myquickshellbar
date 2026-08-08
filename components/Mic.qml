import QtQuick.Layouts
import QtQuick
import "../services" as Services
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)
    color: App.Theme.micBackground

    RowLayout {
        id: layout
        spacing: App.Theme.iconSpacing
        anchors.centerIn: parent

        BarIcon {
            text: Services.AudioService.input?.audio?.muted ? App.Theme.muteMicIcon : App.Theme.volumeMicIcon
        }

        BarText {
            text: Services.AudioService.micVolume()
            font.bold: true
        }
    }

    MouseArea {
        id: mouseArea
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton
        anchors.fill: parent

        onClicked: mouse => {
            Services.AudioService.toggleMicMute();
        }

        onWheel: wheel => {
            if (wheel.angleDelta.y > 0)
                Services.AudioService.volumeMicUp();
            else
                Services.AudioService.volumeMicDown();
        }
    }
}
