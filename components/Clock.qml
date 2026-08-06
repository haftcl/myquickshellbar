import Quickshell.Io
import QtQuick.Layouts
import QtQuick
import "../theme"

Rectangle {
    id: root
    height: Theme.barHeight
    color: "transparent"
    implicitWidth: cloklayout.implicitWidth + Theme.iconSpacing

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
            id: clock
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.ExtraBold
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
            color: Theme.fontColor
            Layout.alignment: Qt.AlignVCenter
            renderType: Text.NativeRendering
            antialiasing: true

            Process {
                // give the process object an id so we can talk
                // about it from the timer
                id: dateProc

                command: ["date", "+%m-%d\ %H:%M"]
                running: true

                stdout: StdioCollector {
                    onStreamFinished: clock.text = this.text
                }
            }

            // use a timer to rerun the process at an interval
            Timer {
                // 1000 milliseconds is 1 second
                interval: 5000

                // start the timer immediately
                running: true

                // run the timer again when it ends
                repeat: true

                // when the timer is triggered, set the running property of the
                // process to true, which reruns it if stopped.
                onTriggered: dateProc.running = true
            }
        }
    }
}
