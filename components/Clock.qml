import Quickshell.Io
import QtQuick.Layouts
import QtQuick
import "../theme"

Rectangle {
    width: row.implicitWidth + 25
    height: parent.height
    radius: Theme.areaRadius
    anchors.centerIn: parent
    color: Theme.centerAreaBackground

    RowLayout {
        id: row
        spacing: 5
        anchors.centerIn: parent

        Text {
            text: "\uf017"
            font.weight: Font.ExtraBold
            font.family: Theme.fontFamily
            font.pixelSize: Theme.iconSize
            color: Theme.fontColor
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            id: clock
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.ExtraBold
            font.family: Theme.fontFamily
            font.pointSize: Theme.fontSize
            color: Theme.fontColor
            Layout.alignment: Qt.AlignVCenter

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
