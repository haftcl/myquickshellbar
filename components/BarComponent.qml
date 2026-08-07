import QtQuick
import ".." as App

Rectangle {
    required property Area area

    color: "transparent"
    radius: App.Theme.areaRadius
    implicitHeight: App.Theme.barHeight - (App.Theme.barPadding * 2)
}
