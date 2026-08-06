import QtQuick.Layouts
import QtQuick
import ".." as App

Rectangle {
    id: root
    height: App.Theme.barHeight
    color: "transparent"
    implicitWidth: cloklayout.implicitWidth + App.Theme.iconSpacing

    property string clockText: ""

    // 2. Timer that ticks every second
    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            root.clockText = Qt.formatDateTime(new Date(), App.Theme.dateFormat);
        }
    }

    RowLayout {
        id: cloklayout
        anchors.centerIn: parent
        spacing: App.Theme.iconSpacing

        Text {
            text: App.Theme.clockIcon
            font.weight: Font.ExtraBold
            font.family: App.Theme.fontFamily
            font.pixelSize: App.Theme.fontSize
            color: App.Theme.fontColor
            Layout.alignment: Qt.AlignVCenter
            renderType: Text.NativeRendering
            antialiasing: true
        }

        Text {
            text: root.clockText
            id: clock
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.ExtraBold
            font.family: App.Theme.fontFamily
            font.pixelSize: App.Theme.fontSize
            color: App.Theme.fontColor
            Layout.alignment: Qt.AlignVCenter
            renderType: Text.NativeRendering
            antialiasing: true
        }
    }
}
