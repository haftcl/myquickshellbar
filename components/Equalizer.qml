pragma ComponentBehavior: Bound
import QtQuick
import ".." as App

Row {
    id: root

    // State
    property bool playing: false

    // Appearance
    property int bars: 5
    property int barWidth: 2
    property int barSpacing: 3
    property int minHeight: 4
    property int maxHeight: 12

    // Animation
    property int duration: 300
    property int durationStep: 100

    // Styling
    property int radius: 0

    spacing: barSpacing
    width: bars * barWidth + (bars - 1) * barSpacing
    height: maxHeight

    Repeater {
        id: repeater
        model: root.bars

        delegate: Rectangle {
            id: bar
            required property int index

            width: root.barWidth
            height: root.playing ? root.minHeight : root.minHeight
            radius: root.radius

            anchors.bottom: parent.bottom
            color: App.Theme.fontColor

            SequentialAnimation on height {
                running: root.playing
                loops: Animation.Infinite

                NumberAnimation {
                    from: root.minHeight
                    to: root.maxHeight
                    duration: root.duration + bar.index * root.durationStep
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    from: root.maxHeight
                    to: root.minHeight
                    duration: root.duration + bar.index * root.durationStep
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: App.Theme.animationDuration
                }
            }
        }
    }
}
