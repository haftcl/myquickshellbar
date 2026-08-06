import QtQuick.Layouts
import QtQuick
import "../theme"

Rectangle {
    id: root
    height: Theme.barHeight
    color: "transparent"
    implicitWidth: cloklayout.implicitWidth + Theme.iconSpacing

    property string clockText: ""

    // 2. Timer that ticks every second
    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            root.clockText = Qt.formatDateTime(new Date(), Theme.dateFormat);
        }
    }

    RowLayout {
        id: cloklayout
        anchors.centerIn: parent
        spacing: Theme.iconSpacing

        Text {
            text: Theme.clockIcon
            font.weight: Font.ExtraBold
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
            color: Theme.fontColor
            Layout.alignment: Qt.AlignVCenter
            renderType: Text.NativeRendering
            antialiasing: true
        }

        Text {
            text: root.clockText
            id: clock
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.ExtraBold
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
            color: Theme.fontColor
            Layout.alignment: Qt.AlignVCenter
            renderType: Text.NativeRendering
            antialiasing: true
        }
    }
}
