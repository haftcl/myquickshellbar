import QtQuick.Layouts
import QtQuick
import ".." as App

Rectangle {
    id: root
    color: "transparent"
    implicitHeight: App.Theme.barHeight
    implicitWidth: layout.implicitWidth + (App.Theme.componentPadding * 2)

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
        id: layout
        anchors.centerIn: parent
        spacing: App.Theme.iconSpacing

        BarIcon {
            text: App.Theme.clockIcon
            font.weight: Font.ExtraBold
            Layout.alignment: Qt.AlignVCenter
        }

        BarText {
            id: clock
            text: root.clockText
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.ExtraBold
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
