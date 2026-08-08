import QtQuick.Layouts
import QtQuick
import ".." as App

BarComponent {
    id: root
    implicitWidth: calculateWidth(layout.implicitWidth)

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
        }

        BarText {
            id: clock
            text: root.clockText
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.ExtraBold
        }
    }
}
